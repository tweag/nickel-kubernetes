use openapi::v2::Spec;

pub fn get_k8s_specs(path_to_swagger_json: &str) -> Option<Spec> {
  match openapi::from_path(path_to_swagger_json) {
    Ok(open_api) => match open_api {
      openapi::OpenApi::V2(spec) => Some(spec),
      _ => None,
    },
    Err(_) => None,
  }
}
