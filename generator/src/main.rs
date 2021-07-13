fn main() {
  match openapi::from_path("src/swagger.json") {
    Ok(spec) => println!("spec: {:?}", spec),
    Err(err) => println!("error: {}", err)
  }
}
