use rstest::rstest;

use tweag_gen_k8s_nickel::format::format_ncl;

#[rstest]
#[case("{a = 1}", "{\n  a = 1\n}")]
#[case("{a = {b = 1}}", "{\n  a = {\n    b = 1\n  }\n}")]
#[case(
  "{a = {b = {c = 1 }}}",
  "{\n  a = {\n    b = {\n      c = 1 \n    }\n  }\n}"
)]
#[case("{a = 1,b = 1}", "{\n  a = 1,\n  b = 1\n}")]
#[case(
  "{a = 1,b = 1,c = {d = 1,e = 1}}",
  "{\n  a = 1,\n  b = 1,\n  c = {\n    d = 1,\n    e = 1\n  }\n}"
)]
#[case(
  "{a = 1,b = 1,c = {d = 1,e = 1},f = 1}",
  "{\n  a = 1,\n  b = 1,\n  c = {\n    d = 1,\n    e = 1\n  },\n  f = 1\n}"
)]
fn it_format_ncl(#[case] input: String, #[case] expected: String) {
  assert_eq!(expected, format_ncl(input));
}
