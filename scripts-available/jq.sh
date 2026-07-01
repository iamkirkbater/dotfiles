#!/bin/bash

## A set of JQ helpers

table () {
  jq -r 'if .|type != "array" then error("Expected a list") else . end | if .[0]|type != "object" then error ("Expected a list of objects") else . end | [(.[0] | keys), .[]] | .[] | [(to_entries[].value)] | @tsv' | column -t
}
