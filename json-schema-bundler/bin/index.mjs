#! /usr/bin/env node
import $RefParser from "@apidevtools/json-schema-ref-parser"

// Pass a file path, URL, or string as the first argument
const input_schema = process.argv[2]
const schema = await $RefParser.bundle(input_schema)
console.log(JSON.stringify(schema, null, 2))
