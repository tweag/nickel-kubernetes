pub fn format_ncl(text: String) -> String {
  let (_, _, formatted_text): (usize, bool, String) = text.chars().fold(
    (0, false, "".to_string()),
    |p: (usize, bool, String), letter| {
      let (indent, skip_newlining, txt) = p;
      let mut result = txt.clone();

      match (letter, skip_newlining) {
        ('"', _) => {
          result.push(letter);
          (indent, !skip_newlining, result)
        }
        ('{', false) => {
          result.push(letter);
          (
            indent + 2,
            skip_newlining,
            result + "\n" + " ".repeat(indent + 2).as_str(),
          )
        }
        ('}', false) => {
          result.push_str("\n");
          result.push_str(" ".repeat(indent - 2).as_str());
          result.push(letter);
          (indent - 2, skip_newlining, result)
        }
        (',', false) => {
          result.push(letter);
          (
            indent,
            skip_newlining,
            result + "\n" + " ".repeat(indent).as_str(),
          )
        }
        _ => {
          result.push(letter);
          (indent, skip_newlining, result)
        }
      }
    },
  );
  formatted_text
}

pub fn _are_brackets_balanced(text: &String) -> bool {
  let opening_bracket = text.find('{');
  let closing_bracket = text.rfind('}');
  match (opening_bracket, closing_bracket) {
    (Some(oi), Some(ci)) => {
      let distance_between_brackets = ci - oi;
      if distance_between_brackets <= 1 {
        true
      } else {
        _are_brackets_balanced(&text[(oi + 1)..(ci)].to_string())
      }
    }
    (Some(_), None) => false,
    (None, Some(_)) => false,
    (None, None) => true,
  }
}

#[cfg(test)]
mod tests {
  use super::*;
  use rstest::rstest;

  #[rstest]
  #[case("", true)]
  #[case("The quick brown fox jumps over the lazy dog", true)]
  #[case("{}", true)]
  #[case("{{}}", true)]
  #[case("{{{}}}", true)]
  #[case("{ a = { b = { c = 1; }; }; }", true)]
  #[case("{", false)]
  #[case("}", false)]
  #[case("{{}", false)]
  #[case("{}}", false)]
  #[case("{{}}}", false)]
  #[case("{{{}}", false)]
  #[case("{ a = { b = { c = 1; }; }", false)]
  fn test_are_brackets_balanced(#[case] input: String, #[case] expected: bool) {
    assert_eq!(expected, _are_brackets_balanced(&input));
  }
}
