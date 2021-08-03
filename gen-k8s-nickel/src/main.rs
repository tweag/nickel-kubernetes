use clap::{
  crate_authors,
  crate_description,
  crate_name,
  crate_version,
  App,
  Arg,
};

use tweag_gen_k8s_nickel::as_ncl::AsNcl;
use tweag_gen_k8s_nickel::format::format_ncl;
use tweag_gen_k8s_nickel::k8s::get_k8s_specs;

fn main() {
  let matches = App::new(crate_name!())
  .version(crate_version!())
  .author(crate_authors!())
  .about(crate_description!())
  .arg(
    Arg::with_name("k8s")
      .takes_value(true)
      .value_name("path-to-swagger.json")
      .required(true)
      .help("path to swagger.json OpenAPI specification, describing Kubernetes API"),
  ).get_matches();

  if matches.is_present("version") {
    println!(crate_version!());
    std::process::exit(0);
  };

  let path_to_openapi_def = std::path::Path::new(
    matches
      .value_of("k8s")
      .map_or("<path-to-k8s-swagger-json-not-provided>", |p| p),
  )
  .to_path_buf();

  match get_k8s_specs(path_to_openapi_def) {
    Some(spec) => match spec.definitions {
      Some(defs) => {
        let mut a = "{".to_string();
        for (name, schema) in defs.into_iter() {
          let b = schema.to_ncl(name.as_str(), true);
          a.push_str(b.as_str());
          a.push_str(",");
        }
        a.push_str("}");
        let c = format_ncl(a);
        println!("{}", c);
      }
      None => (),
    },
    None => (),
  }
}
