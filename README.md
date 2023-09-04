# W3Strings encoding action

This action encodes CSV files to W3Strings.

## Inputs

## `csv-path`

**Required** The CSV file to encode.

## `id-space`

**Required** The ID space for the localization strings.

## `out-dir`

**Optional** The output directory for the encoded strings

## `language`

**Optional** The language for the CSV to be encoded to

## Example usage

```yml
uses: abheekda1/w3strings-action@v2.0
with:
  csv-path: 'en.w3strings.csv'
  id-space: 1111
  out-dir: 'w3strings'
  language: 'en'
```
