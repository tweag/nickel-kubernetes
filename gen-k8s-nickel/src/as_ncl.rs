pub trait AsNcl {
  fn to_ncl(&self, name: &str, indent: usize) -> String;
}

fn k8s_to_ncl_id(name: &str) -> String {
  name.replace(".", "_")
}

fn k8s_ref_to_ncl_id(r: &str) -> String {
  k8s_to_ncl_id(r.replace("#/definitions/", "").as_str())
}

impl AsNcl for openapi::Schema {
  fn to_ncl(&self, name: &str, indent: usize) -> String {
    let _dot = k8s_to_ncl_id(name);
    let _name = _dot.as_str();
    if self.schema_type.as_ref().is_some() {
      self.schema_type.as_ref().map_or("".to_string(), |schema_type| {
        match schema_type.to_lowercase().as_str() {
          "object" => {
            if self.properties.as_ref().is_none() {
              format!("{}{}", format_args!("{:>1$}", "", indent), format!("{} | #(utils.DictStrStr)", _name))
            } else {
              let t = self.properties.as_ref().map_or("".to_string(), |properties|{
                properties.into_iter().map(|p| {
                  let (n, s) = p;
                  s.to_ncl(n.as_str(), indent + 2)
                }).collect::<Vec<String>>()
                .join(",\n") + ","
              });
              format!("{}{} = {{\n{}\n{}}},", format_args!("{:>1$}", "", indent), _name, t, format_args!("{:>1$}", "", indent))
            }
          },
          "array" => {
            let t = format!("{} | List {}", _name, self.items.as_ref().map_or("".to_string(), |items| items.ref_path.as_ref().map_or("".to_string(), |f| k8s_ref_to_ncl_id(f)) ));
            format!("{}{}", format_args!("{:>1$}", "", indent), t)
          },
          "integer" => {
            let t = format!("{} | #(nums.Int)", _name);
            format!("{}{}", format_args!("{:>1$}", "", indent), t)
          },
          "string" => {
            let t = format!("{} | Str", _name);
            format!("{}{}", format_args!("{:>1$}", "", indent), t)
          },
          _ => format!("3:{:?}", _name)
        }
      })
    } else {
      let t = self.ref_path.as_ref().map_or("".to_string(), |r| format!("{} | {}", _name, k8s_ref_to_ncl_id(r)));
      format!("{}{}", format_args!("{:>1$}", "", indent), t)
    }
  }
}
