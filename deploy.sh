#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd out

git init
git config user.name "Ashley Hindmarsh"
git config user.email "ash+github@best-scarper.co.uk"

git remote add upstream "https://$GH_TOKEN@github.com/bestscarper/ash-cv.git"
git fetch upstream
git reset upstream/gh-pages

echo "www.bellesoft.uk" > CNAME

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
