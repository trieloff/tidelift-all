#!/bin/bash
echo "adding tidelift.yml"
for REPO in "$@"
do
    git clone "git@github.com:adobe/$REPO.git"
    cd "$REPO"
    if [ -f ".tidelift.yml" ]; then
        echo "skipping $REPO, .tidelift.yml already exists"
    else
        cp ../.tidelift.yml .
        git add .tidelift.yml
        git commit -m "chore(tidelift): adding list of forbidden licenses"
        git push
    fi
    cd ..
done