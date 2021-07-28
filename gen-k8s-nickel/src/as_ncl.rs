pub trait AsNcl {
  fn to_ncl(&self, name: &str, force_xyz: bool) -> String;
}

impl AsNcl for openapi::Schema {
  fn to_ncl(&self, name: &str, force_xyz: bool) -> String {
    let ncl_id = k8s_to_ncl_id(name);
    let contract = get_contract(self);
    if contract.starts_with("=") {
      format!("{} {}", ncl_id, contract)
    } else if force_xyz {
      format!("{} {}", ncl_id, contract_to_xyz(&contract))
    } else {
      format!("{} | {}", ncl_id, contract)
    }
  }
}

pub fn contract_to_xyz(contract: &String) -> String {
  let type_name = if contract != "Dyn" {
    contract.as_str()
  } else {
    "Record"
  };
  format!("= fun label value => if (builtins.is{} value) then value else contracts.blame label", type_name)
}

fn k8s_to_ncl_id(name: &str) -> String {
  name.replace(".", "_").replace("-", "_")
}

fn k8s_ref_to_ncl_id(r: &str) -> String {
  k8s_to_ncl_id(r.replace("#/definitions/", "").as_str())
}

fn quote_if_has_ncl_reserved_chars(text: &String) -> String {
  let text_as_str = text.as_str();
  if text_as_str.contains("$") {
    return format!("\"{}\"", text)
  }

  match text_as_str {
    "default" => "\"default\"".to_string(),
    _ => text.clone(),
  }
}

fn get_contract(schema: &openapi::Schema) -> String {
  schema.schema_type.as_ref().map_or_else(
    || {
      schema
        .ref_path
        .as_ref()
        .map_or("<sensible_warning>".to_string(), |ref_path| {
          "#".to_string() + &k8s_ref_to_ncl_id(ref_path.as_str())
        })
    },
    |schema_type| match schema_type.as_str() {
      "integer" => "Num".to_string(),  // TODO: Improve
      "boolean" => "Bool".to_string(), // TODO: Improve
      "string" => "Str".to_string(),
      "array" => schema
        .items
        .as_ref()
        .map_or("List <sensible_warning>".to_string(), |items| {
          format!("List {}", get_contract(&items))
        }),
      "object" => schema.properties.as_ref().map_or_else(
        || "Dyn".to_string(), // TODO: Improve
        |properties| {
          let inner = properties
            .into_iter()
            .map(|(property_name, def)| {
              def.to_ncl(quote_if_has_ncl_reserved_chars(property_name).as_str(), false)
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
  fn test_quote_if_has_ncl_reserved_chars(#[case] input: String, #[case] expected: String) {
    assert_eq!(expected, quote_if_has_ncl_reserved_chars(&input));
  }
}
