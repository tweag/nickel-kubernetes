lazy_static::lazy_static! {
  pub static ref DEFINITIONS_OVERRIDES: std::collections::HashMap<&'static str, &'static str> = [
      ("io.k8s.apimachinery.pkg.apis.meta.v1.Time", r#"= fun label value => if strings.isMatch value "^((?:(\\d{4}-\\d{2}-\\d{2})[T,t](\\d{2}:\\d{2}:\\d{2}(?:\\.\\d+)?))(Z|[\\+-]\\d{2}:\\d{2})?)$" then value else contracts.blame label"#),
      ("b", "bear"),
  ].iter().copied().collect();
}
