fn main() {
  let args: Vec<String> = std::env::args().collect();
  let path_to_openapi_def = args.get(1).map_or("error", |x|x);
  match openapi::from_path(path_to_openapi_def) {
    Ok(spec) => {
      for (name, schema) in spec.definitions.into_iter() {
        println!("name: {:?}", name);
        println!("spec: {:?}", schema);
      };
    },
    Err(err) => println!("error: {}", err)
  }
}
