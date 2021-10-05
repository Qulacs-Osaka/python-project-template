#!/bin/bash
set -ex

function validate_project_name() {
    local pattern=" "
    if [[ $1 =~ $pattern ]]
    then
        echo "Project name must not contain space."
        exit 1
    fi
}

function rename_project_in_file() {
    echo $1
}
export -f rename_project_in_file

function rename_project() {
    local files=$(find . \
    -not \( -path "./.venv" -prune \) \
    -not \( -path "./.git" -prune \) \
    -not \( -path "./.pytest_cache" -prune \) \
    -not \( -path "./.mypy_cache" -prune \) \
    -type f)
    for file in $files; do
        rename_project_in_file $file
    done
}

RENAME_FROM="project-template"
RENAME_TO=$1
validate_project_name "$RENAME_TO"
rename_project
