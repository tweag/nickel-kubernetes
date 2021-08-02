use crate::defs_overrides::DEFINITIONS_OVERRIDES;

pub trait AsNcl {
  fn to_ncl(&self, name: &str, force_xyz: bool) -> String;
}

impl AsNcl for openapi::v2::Schema {
  fn to_ncl(&self, name: &str, force_xyz: bool) -> String {
    let ncl_id = _k8s_to_ncl_id(name);
    let contract: String;

    if DEFINITIONS_OVERRIDES.contains_key(name) {
      contract = DEFINITIONS_OVERRIDES
        .get(name)
        .unwrap_or(&"")
        .to_owned()
        .to_owned()
        .to_string();
    } else {
      contract = get_contract(self);
    }

    if contract.starts_with("=") {
      format!("{} {}", ncl_id, contract)
    } else if force_xyz {
      format!("{} {}", ncl_id, _contract_to_xyz(&contract))
    } else {
      format!("{} | {}", ncl_id, contract)
    }
  }
}

fn _contract_to_xyz(contract: &String) -> String {
  let type_name = if contract != "Dyn" {
    contract.as_str()
  } else {
    "Record"
  };
  format!("= fun label value => if (builtins.is{} value) then value else contracts.blame label", type_name)
}

fn _k8s_to_ncl_id(name: &str) -> String {
  name.replace(".", "_").replace("-", "_")
}

fn _k8s_ref_to_ncl_id(r: &str) -> String {
  _k8s_to_ncl_id(r.replace("#/definitions/", "").as_str())
}

fn _quote_if_has_ncl_reserved_chars(text: &String) -> String {
  let text_as_str = text.as_str();
  if text_as_str.contains("$") {
    return format!("\"{}\"", text);
  }

  match text_as_str {
    "default" => "\"default\"".to_string(),
    _ => text.clone(),
  }
}

fn _get_x_k8s_group_version_kind(
  schema: &openapi::v2::Schema,
) -> Option<(String, String, String)> {
  schema
    .other
    .to_owned()
    .into_iter()
    .filter_map(|(key, val)| {
      if key != "x-kubernetes-group-version-kind" {
        None
      } else {
        val
          .as_array()
          .map(|vec| {
            vec
              .first()
              .map(|o| {
                o.as_object().map(|obj| {
                  let group = obj.get("group").map_or("".to_string(), |g| {
                    g.as_str().map_or("".to_string(), |gg| gg.to_string())
                  });
                  let kind = obj.get("kind").map_or("".to_string(), |k| {
                    k.as_str().map_or("".to_string(), |kk| kk.to_string())
                  });
                  let version =
                    obj.get("version").map_or("".to_string(), |v| {
                      v.as_str().map_or("".to_string(), |vv| vv.to_string())
                    });
                  (group, version, kind)
                })
              })
              .flatten()
          })
          .flatten()
      }
    })
    .collect::<Vec<(String, String, String)>>()
    .first()
    .map(|t| t.clone())
}

fn _get_object_property_contract(
  property_name: &String,
  def: &openapi::v2::Schema,
  k8s_group_version_kind: &Option<(String, String, String)>,
) -> String {
  if k8s_group_version_kind.is_none() {
    return def.to_ncl(
      _quote_if_has_ncl_reserved_chars(property_name).as_str(),
      false,
    );
  }

  let (group, version, kind) = k8s_group_version_kind.clone().unwrap_or((
    "".to_string(),
    "".to_string(),
    "".to_string(),
  ));

  match property_name.as_str() {
    "kind" => format!("{} = \"{}\"", property_name, kind),
    "apiVersion" => format!(
      "{} = \"{}\"",
      property_name,
      vec![group.clone(), version.clone()]
        .into_iter()
        .filter(|x| !x.is_empty())
        .collect::<Vec<String>>()
        .join("/")
    ),
    _ => def.to_ncl(
      _quote_if_has_ncl_reserved_chars(property_name).as_str(),
      false,
    ),
  }
}

fn get_contract(schema: &openapi::v2::Schema) -> String {
  let k8s_group_version_kind = _get_x_k8s_group_version_kind(schema);

  schema.schema_type.as_ref().map_or_else(
    || {
      schema
        .ref_path
        .as_ref()
        .map_or("<sensible_warning>".to_string(), |ref_path| {
          "#".to_string() + &_k8s_ref_to_ncl_id(ref_path.as_str())
        })
    },
    |schema_type| match schema_type.as_str() {
      "integer" => "Num".to_string(),
      "number" => "Num".to_string(),
      "boolean" => "Bool".to_string(),
      "string" => "Str".to_string(),
      "array" => schema
        .items
        .as_ref()
        .map_or("List <sensible_warning>".to_string(), |items| {
          format!("List {}", get_contract(&items))
        }),
      "object" => schema.properties.as_ref().map_or_else(
        || "Dyn".to_string(),
        |properties| {
          let inner = properties
            .into_iter()
            .map(|(property_name, def)| {
              _get_object_property_contract(
                property_name,
                def,
                &k8s_group_version_kind,
              )
            })
            .collect::<Vec<String>>()
            .join(", ");
          format!("= {{{}}}", inner)
        },
      ),
      _ => "<sensible_warning>".to_string(),
    },
  )
}

#[cfg(test)]
mod tests {
  use super::*;
  use rstest::rstest;

  #[rstest]
  #[case("apiGroup", "apiGroup")]
  #[case("default", "\"default\"")]
  #[case("$ref", "\"$ref\"")]
  #[case("$schema", "\"$schema\"")]
  #[case("weird$word", "\"weird$word\"")]
  fn test_quote_if_has_ncl_reserved_chars(
    #[case] input: String,
    #[case] expected: String,
  ) {
    assert_eq!(expected, _quote_if_has_ncl_reserved_chars(&input));
  }

  #[rstest]
  #[case("io.k8s.api.apps.v1.Deployment", "io_k8s_api_apps_v1_Deployment")]
  #[case("io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.CustomResourceDefinition", "io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_CustomResourceDefinition")]
  #[case("imaginaryIdentifierWithoutDots", "imaginaryIdentifierWithoutDots")]
  fn test_k8s_to_ncl_id(#[case] input: String, #[case] expected: String) {
    assert_eq!(expected, _k8s_to_ncl_id(&input));
  }

  #[rstest]
  #[case(
    "#/definitions/io.k8s.apimachinery.pkg.apis.meta.v1.Time",
    "io_k8s_apimachinery_pkg_apis_meta_v1_Time"
  )]
  #[case(
    "#/definitions/io.k8s.some-thing.Something",
    "io_k8s_some_thing_Something"
  )]
  #[case(
    "#/definitions/imaginaryIdentifierWithoutDots",
    "imaginaryIdentifierWithoutDots"
  )]
  #[case("imaginaryIdentifierWithoutDots", "imaginaryIdentifierWithoutDots")]
  #[case("#/definitions/42", "42")]
  fn test_k8s_ref_to_ncl_id(#[case] input: String, #[case] expected: String) {
    assert_eq!(expected, _k8s_ref_to_ncl_id(&input));
  }
}
