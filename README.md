# W3Strings encoding action

This action encodes CSV files to W3Strings.

## Inputs

## `csv-path`

**Required** The CSV file to encode.

## `id-space`

**Required** The ID space for the localization strings.

## Example usage

uses: actions/w3strings-action@v1
with:
  csv-path: 'en.w3strings.csv'
  id-space: 1111
