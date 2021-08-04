use openapi::v2::Spec;
use rstest::{
  fixture,
  rstest,
};

use tweag_gen_k8s_nickel::as_ncl::AsNcl;
use tweag_gen_k8s_nickel::k8s::get_k8s_specs;

#[fixture]
fn openapi_k8s_def_fxt() -> Option<Spec> {
  std::env::var("OPENAPI_SPECS_K8S_DIR").map_or(None, |path| {
    get_k8s_specs(std::path::Path::new(&path).join("1.21.3.json"))
  })
}

#[rstest]
#[case("io.k8s.api.admissionregistration.v1.ServiceReference")]
#[case("io.k8s.api.admissionregistration.v1beta1.MutatingWebhook")]
#[case("io.k8s.apimachinery.pkg.api.resource.Quantity")]
#[case("io.k8s.apimachinery.pkg.apis.meta.v1.APIResourceList")]
#[case("io.k8s.apimachinery.pkg.apis.meta.v1.FieldsV1")]
#[case("io.k8s.api.apps.v1.ControllerRevision")]
fn it_to_ncl(openapi_k8s_def_fxt: Option<Spec>, #[case] name: String) {
  match openapi_k8s_def_fxt {
    Some(spec) => match spec.definitions {
      Some(defs) => {
        match defs.get(&name) {
          Some(schema) => {
            assert_eq!(
              EXPECTED_DEFINITIONS
                .get(name.as_str())
                .unwrap_or(&"<sensible_error>")
                .to_string(),
              schema.to_ncl(name.as_str(), true)
            );
          }
          None => assert!(false),
        }
        ()
      }
      None => assert!(false),
    },
    None => assert!(false),
  }
}

lazy_static::lazy_static! {
  pub static ref EXPECTED_DEFINITIONS: std::collections::HashMap<&'static str, &'static str> = [
      ("io.k8s.api.admissionregistration.v1.ServiceReference", "io_k8s_api_admissionregistration_v1_ServiceReference = {name | Str,namespace | Str,path | Str,port | Num}"),
      ("io.k8s.api.admissionregistration.v1beta1.MutatingWebhook", "io_k8s_api_admissionregistration_v1beta1_MutatingWebhook = {admissionReviewVersions | List Str,clientConfig | #io_k8s_api_admissionregistration_v1beta1_WebhookClientConfig,failurePolicy | Str,matchPolicy | Str,name | Str,namespaceSelector | #io_k8s_apimachinery_pkg_apis_meta_v1_LabelSelector,objectSelector | #io_k8s_apimachinery_pkg_apis_meta_v1_LabelSelector,reinvocationPolicy | Str,rules | List #io_k8s_api_admissionregistration_v1beta1_RuleWithOperations,sideEffects | Str,timeoutSeconds | Num}"),
      ("io.k8s.apimachinery.pkg.api.resource.Quantity", "io_k8s_apimachinery_pkg_api_resource_Quantity = fun label value => if (builtins.isStr value) then value else contracts.blame label"),
      ("io.k8s.apimachinery.pkg.apis.meta.v1.APIResourceList", "io_k8s_apimachinery_pkg_apis_meta_v1_APIResourceList = {apiVersion = \"v1\",groupVersion | Str,kind = \"APIResourceList\",resources | List #io_k8s_apimachinery_pkg_apis_meta_v1_APIResource}"),
      ("io.k8s.apimachinery.pkg.apis.meta.v1.FieldsV1", "io_k8s_apimachinery_pkg_apis_meta_v1_FieldsV1 = fun label value => if (builtins.isRecord value) then value else contracts.blame label"),
      ("io.k8s.api.apps.v1.ControllerRevision", "io_k8s_api_apps_v1_ControllerRevision = {apiVersion = \"apps/v1\",data | #io_k8s_apimachinery_pkg_runtime_RawExtension,kind = \"ControllerRevision\",metadata | #io_k8s_apimachinery_pkg_apis_meta_v1_ObjectMeta,revision | Num}")
  ].iter().copied().collect();
}
