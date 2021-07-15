pub trait AsNcl {
  fn to_ncl(&self, name: &str) -> String;
}

impl AsNcl for openapi::Schema {
  fn to_ncl(&self, name: &str) -> String {
    self.schema_type.as_ref().map_or("".to_string(), |schema_type| {
      match schema_type.to_lowercase().as_str() {
        "object" => {
          let mut prefix: String = format!("let {} = {{{}", name, std::path::MAIN_SEPARATOR);
          let suffix = "}";
          let middle = self.properties.as_ref().map_or("".to_string(), |properties|{
            properties.into_iter().map(|p| {
              let (n, s) = p;
              s.to_ncl(n.as_str())
            }).collect::<Vec<String>>()
            .join(format!(", {}", std::path::MAIN_SEPARATOR).as_str())
          });
          prefix.push_str(middle.as_str());
          prefix.push_str(suffix);
          prefix
        },
        "integer" => format!("{} | #(nums.Int)", name),
        "string" => format!("{} | Str", name),
        _ => "".to_string()
      }
    })
  }
}
