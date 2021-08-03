use openapi::v2::Spec;
use rstest::{
  fixture,
  rstest,
};

use tweag_gen_k8s_nickel::k8s::get_k8s_specs;

#[fixture]
fn openapi_k8s_def_fxt() -> Option<Spec> {
  std::env::var("K8S_NICKEL_SPECS_DIR").map_or(None, |path| {
    get_k8s_specs(std::path::Path::new(&path).join("1.21.3.json"))
  })
}

#[rstest]
#[case("")]
fn it_to_ncl(openapi_k8s_def_fxt: Option<Spec>, #[case] name: String) {
  match openapi_k8s_def_fxt {
    Some(spec) => match spec.definitions {
      Some(defs) => {
        //TODO: Write integration tests
        assert!(true)
      }
      None => assert!(false),
    },
    None => assert!(false),
  }
}
