# json-schema-bundler

**json-schema-bundler** is a CLI wrapper around `json-schema-ref-parser` that
simplifies the bundling process of JSON schemas. It takes a JSON schema file as
input and outputs a bundled version where all external references have been
inlined in the schema itself.

This is taken from [@hallettj](https://github.com/hallettj)'s [comment
json-schema-to-nickel
issue](https://github.com/nickel-lang/json-schema-to-nickel/issues/48#issuecomment-1901075634).

This is a very simple package currently used internally for `nickel-kubernetes`:
as such, there's no nice handling of errors, help message, etc. If this wrapper
could be useful to you though, contributions are welcome!

## Usage

```console
npm exec json-schema-bundler <input-schema-file>
```

- `<input-schema-file>`: path to the JSON schema file that you want to bundle.

The bundled JSON schema will be printed to the standard output.

## Example

```console
json-schema-bundler schema.json > schema-bundled.json
```

## License

This project is licensed under the MIT License - see the [LICENSE](../LICENSE)
file for details.
