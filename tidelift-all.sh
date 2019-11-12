#!/bin/bash

FILE=".tidelift.yml"
FORCE="false"
MESSAGE="chore(tidelift): adding list of forbidden licenses"
ORG="adobe"
PARAMS=""
while (( "$#" )); do
  case "$1" in
    -o|--org)
      ORG=$2
      shift 2
      ;;
    -f|--file)
      FILE=$2
      shift 2
      ;;
    -m|--message)
      MESSAGE=$2
      shift 2
      ;;
    -w|--overwrite)
      FORCE="true"
      shift
      ;;
    --) # end argument parsing
      shift
      break
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done
# set positional arguments in their proper place
eval set -- "$PARAMS"

echo "adding $FILE"
for REPO in "$@"
do
    git clone "git@github.com:$ORG/$REPO.git"
    cd "$REPO"
    if [ -f "$FILE" ] && [ "$FORCE" == "false" ] ; then
        echo "skipping $REPO, $FILE already exists"
    else
        cp ../$FILE .
        git add $FILE
        git commit -m "$MESSAGE"
        git push
    fi
    cd ..
done