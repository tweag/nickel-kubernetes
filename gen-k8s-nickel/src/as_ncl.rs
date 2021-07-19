pub trait AsNcl {
  fn to_ncl(&self, name: &str, indent: usize) -> String;
}

fn k8s_to_ncl_id(name: &str) -> String {
  name.replace(".", "_")
}

fn k8s_ref_to_ncl_id(r: &str) -> String {
  k8s_to_ncl_id(r.replace("#/definitions/", "").as_str())
}

fn _to_ref_def(name: &str, indent: usize, ref_path: &Option<String>) -> String {
  ref_path
    .as_ref()
    .map_or(format!("<sensible_warning:{}>", name), |r| {
      format!(
        "{}{} | {}",
        format_args!("{:>1$}", "", indent),
        name,
        k8s_ref_to_ncl_id(r.as_str())
      )
    })
}

fn _to_str_def(name: &str, indent: usize) -> String {
  format!("{}{} | Str", format_args!("{:>1$}", "", indent), name)
}

fn _to_int_def(name: &str, indent: usize) -> String {
  format!(
    "{}{} | #(nums.Int)",
    format_args!("{:>1$}", "", indent),
    name
  )
}

fn _to_list_def(
  name: &str,
  indent: usize,
  items: &Option<Box<openapi::Schema>>,
) -> String {
  let item_type =
    items
      .as_ref()
      .map_or(format!("<sensible_warning:{}>", name), |i| {
        i.ref_path
          .as_ref()
          .map_or(format!("<sensible_warning:{}>", name), |r| {
            k8s_ref_to_ncl_id(r)
          })
      });
  format!(
    "{}{} | List {}",
    format_args!("{:>1$}", "", indent),
    name,
    item_type
  )
}

fn _to_custom_type_def(
  name: &str,
  indent: usize,
  properties: &Option<std::collections::BTreeMap<String, openapi::Schema>>,
) -> String {
  if properties.as_ref().is_none() {
    format!(
      "{}{} | #(utils.DictStrStr)",
      format_args!("{:>1$}", "", indent),
      name
    )
  } else {
    let props_defs =
      properties
        .as_ref()
        .map_or(format!("<sensible_warning:{}>", name), |p| {
          p.into_iter()
            .map(|p| {
              let (n, s) = p;
              s.to_ncl(n.as_str(), indent + 2)
            })
            .collect::<Vec<String>>()
            .join(",\n")
            + ","
        });
    format!(
      "{}{} = {{\n{}\n{}}}",
      format_args!("{:>1$}", "", indent),
      name,
      props_defs,
      format_args!("{:>1$}", "", indent)
    )
  }
}

impl AsNcl for openapi::Schema {
  fn to_ncl(&self, name: &str, indent: usize) -> String {
    let __k8s_name = k8s_to_ncl_id(name);
    let _k8s_name = __k8s_name.as_str();

    self.schema_type.as_ref().map_or_else(
      || _to_ref_def(_k8s_name, indent, &self.ref_path),
      |schema_type| match schema_type.to_lowercase().as_str() {
        "object" => _to_custom_type_def(_k8s_name, indent, &self.properties),
        "array" => _to_list_def(name, indent, &self.items),
        "integer" => _to_int_def(_k8s_name, indent),
        "string" => _to_str_def(_k8s_name, indent),
        _ => format!("<sensible_warning:{}>", _k8s_name),
      },
    )
  }
}
