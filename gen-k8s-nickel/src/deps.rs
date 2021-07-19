use std::iter::FromIterator;
use std::collections::{HashMap, HashSet};
use itertools::Itertools;


fn _get_defs_without_deps(
  deps_graph: &HashMap<String,
  HashSet<String>>
) -> Vec<String> {
  deps_graph.iter().filter_map(|(def_name, deps)| {
    if !deps.is_empty() {
      None
    } else {
      Some(def_name.clone())
    }
  }).sorted().collect()
}

fn _get_def_parents(
  deps_graph: &HashMap<String, HashSet<String>>,
  definition_name: &String
) -> Vec<String> {
  deps_graph.iter().flat_map(|(v, deps)| {
    if deps.contains(definition_name) {
      vec![v.clone()]
    } else {
      vec![]
    }
  }).sorted().collect()
}

fn _get_def_deps(
  deps_graph: &HashMap<String, HashSet<String>>, 
  definition_name: &String
) -> Vec<String> {
  let mut imports = deps_graph.get(definition_name).map_or(
    Vec::<String>::new(),
    |deps| {
      deps.iter().sorted().flat_map(|d| {
        _get_def_deps(deps_graph, d)
      }).collect()
    }
  );

  imports.push(definition_name.clone());
  imports
}

fn _get_all_deps(
  deps_graph: &HashMap<String, HashSet<String>>,
  definition_name: &String
) -> Vec<String> {
  let mut deps = Vec::<String>::new();

  // Itself
  deps.push(definition_name.clone());

  // Its dependencies
  deps.extend(_get_def_deps(deps_graph, definition_name));

  // Its parents
  for parent in &_get_def_parents(deps_graph, definition_name) {
    deps.extend(_get_def_deps(deps_graph, parent));
    deps.extend(_get_all_deps(deps_graph, parent));
  }

  deps
}

fn get_correct_order_of_in_statements(
  deps_graph: &HashMap<String, 
  HashSet<String>>
) -> Vec<String> {
  let definitions_without_dependency = _get_defs_without_deps(deps_graph);
  definitions_without_dependency.iter().flat_map(|def_name| {
    _get_all_deps(deps_graph, def_name)
  }).unique().collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn _create_test_graph() -> HashMap<String, HashSet<String>> {
      let mut dpg = HashMap::<String, HashSet<String>>::new();
      dpg.insert(
        "A".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([
            "C".to_string(), "D".to_string(), "E".to_string()
          ])
        )
      );
      dpg.insert(
        "B".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([
            "D".to_string(), "E".to_string(), "F".to_string()
          ])
        )
      );
      dpg.insert(
        "C".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([
            "G".to_string()
          ])
        )
      );
      dpg.insert(
        "D".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([])
        )
      );
      dpg.insert(
        "E".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([])
        )
      );
      dpg.insert(
        "F".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([])
        )
      );
      dpg.insert(
        "G".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([
            "J".to_string(), "K".to_string(), "H".to_string()
          ])
        )
      );
      dpg.insert(
        "H".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([
            "L".to_string(), "I".to_string()
          ])
        )
      );
      dpg.insert(
        "I".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([
            "N".to_string()
          ])
        )
      );
      dpg.insert(
        "J".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([
            "M".to_string()
          ])
        )
      );
      dpg.insert(
        "K".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([
            "M".to_string()
          ])
        )
      );
      dpg.insert(
        "L".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([
            "N".to_string()
          ])
        )
      );
      dpg.insert(
        "M".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([])
        )
      );
      dpg.insert(
        "N".to_string(),
        HashSet::from_iter(
          std::array::IntoIter::new([])
        )
      );
      dpg
    }

    #[test]
    fn test_definitions_without_dependency() {
      let deps: HashMap<String, HashSet<String>> = _create_test_graph();
      let response: Vec<String> = _get_defs_without_deps(&deps);
      let expected: Vec::<String> = vec![
        "D".to_string(), "E".to_string(), "F".to_string(),
        "M".to_string(), "N".to_string()];
      assert_eq!(response, expected);
    }

    #[test]
    fn test_get_correct_order_of_in_statements() {
      let deps: HashMap<String, HashSet<String>> = _create_test_graph();
      let response: Vec<String> = get_correct_order_of_in_statements(&deps);
      let expected: Vec<String> = vec![
        "D".to_string(), "N".to_string(), "I".to_string(),
        "L".to_string(), "H".to_string(), "M".to_string(),
        "J".to_string(), "K".to_string(), "G".to_string(),
        "C".to_string(), "E".to_string(), "A".to_string(),
        "F".to_string(), "B".to_string(),
      ];
      assert_eq!(response,expected);
    }
}