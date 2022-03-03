#!/bin/bash -l

CSV_FILE="$1"
ID_SPACE="$2"
OUTPUT_DIR="$3"
OUTPUT_LANG="$4"

allLanguages="ar br cn cz de en es esmx fr hu it jp kr pl ru zh"

mkdir -p "$OUTPUT_DIR"

function encode {
    OUTPUT="$1"
    w3strings -e "$CSV_FILE" -i "$ID_SPACE" --very-verbose
    mv "$CSV_FILE.w3strings" "$OUTPUT"
    rm "$CSV_FILE.w3strings.ws"
}

function check_language_validity {
    LANGUAGE="$1"

    isLanguageValid=false
    for lang in ${allLanguages}
    do
        if [ "$LANGUAGE" = "$lang" ] || [ "$LANGUAGE" = "all" ]
        then
            return
        fi
    done

    # If the language isn't found...
    echo "Invalid language!"
    exit 1
}

check_language_validity "$OUTPUT_LANG"

if [[ "$OUTPUTFILE" = "all" ]]
then
    for lang in ${allLanguages}
    do
        encode "$lang.w3strings"
    done
else
    encode "$OUTPUT_LANG.w3strings"
fi
