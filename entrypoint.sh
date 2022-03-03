#!/bin/sh -l

CSV_FILE="$1"
ID_SPACE="$2"
OUTPUT_DIR="$3"
OUTPUT_LANG="$4"

ALL_LANGUAGES=("ar" "br" "cn" "cz" "de" "en" "es" "esmx" "fr" "hu" "it" "jp" "kr" "pl" "ru" "zh")

mkdir -p "$OUTPUT_DIR"

check_language_validity "$OUTPUT_LANG"

if [[ "$OUTPUTFILE" = "all" ]]
then
    for lang in ${ALL_LANGUAGES[@]}
    do
        encode "$lang.w3strings"
    done
else
    encode "$OUTPUT_LANG.w3strings"
fi

function encode {
    OUTPUT="$1"
    /w3strings/w3strings -e "$CSV_FILE" "$OUTPUT" -i "$ID_SPACE" --very-verbose
}

function check_language_validity {
    LANGUAGE="$1"
    VALID_LANGUAGES="$ALL_LANGUAGES"
    for lang in ${VALID_LANGUAGES[@]}
    do
        if [[ "$LANGUAGE" = lang ]]
        then
            break;
        fi
    done

    # If the language isn't found...
    echo "Invalid language!"
    exit 1
}
