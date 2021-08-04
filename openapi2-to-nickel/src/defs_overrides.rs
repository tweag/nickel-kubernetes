lazy_static::lazy_static! {
  pub static ref DEFINITIONS_OVERRIDES: std::collections::HashMap<&'static str, &'static str> = [
      ("io.k8s.apimachinery.pkg.apis.meta.v1.Time", r#"= fun label value => if strings.isMatch value "^((?:(\\d{4}-\\d{2}-\\d{2})[T,t](\\d{2}:\\d{2}:\\d{2}(?:\\.\\d+)?))(Z|[\\+-]\\d{2}:\\d{2})?)$" then value else contracts.blame label"#),
      ("io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.JSON", r#"= fun label value => if (builtins.isRecord value) then value else contracts.blame label"#),
      ("io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.JSONSchemaPropsOrArray", r#"= fun label value => if (builtins.isList value) then value else contracts.blame label"#),        //TODO: Improve
      ("io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.JSONSchemaPropsOrBool", r#"= fun label value => if (builtins.isBool value) then value else contracts.blame label"#),         //TODO: Improve
      ("io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.JSONSchemaPropsOrStringArray", r#"= fun label value => if (builtins.isList value) then value else contracts.blame label"#),  //TODO: Improve
      ("io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSON", r#"= fun label value => if (builtins.isRecord value) then value else contracts.blame label"#),
      ("io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaPropsOrArray", r#"= fun label value => if (builtins.isList value) then value else contracts.blame label"#),        //TODO: Improve
      ("io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaPropsOrBool", r#"= fun label value => if (builtins.isBool value) then value else contracts.blame label"#),         //TODO: Improve
      ("io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaPropsOrStringArray", r#"= fun label value => if (builtins.isList value) then value else contracts.blame label"#),  //TODO: Improve
  ].iter().copied().collect();
}
