#!/bin/bash

echo "Starting deployment" 
echo "Getting deployment target."

TARGET=$TARGET

echo "Getting source harp.js code from $TRAVIS_REPO_SLUG"
CURRENT_REPO_SLUG=$(echo $TRAVIS_REPO_SLUG | cut -d "/" -f2 )
CURRENT_COMMIT=`git rev-parse HEAD`

echo "Targeting $TARGET repository"

echo "Cloning repository from $TARGET"
cd ../
git clone $TARGET_URL_CREDENTIALS || exit 1
cd $TARGET || exit 1
ls || exit 1

echo "Checking out dev from $TARGET"
git checkout dev || exit 1
ls || exit 1
cd ../

echo "Compiling new static content for $TARGET_URL_CREDENTIALS"
harp compile $CURRENT_REPO_SLUG $TARGET || exit 1
cd $TARGET

echo "Commit updates"
git add -A || exit 1
git commit --allow-empty -m "Compiled content for $CURRENT_COMMIT" || exit 1

echo "Pushing updates"
git push --force --quiet "$TARGET_URL_WITH_CREDENTIALS" || exit 1

cd ../

echo "Cleaning up temp files"  
rm -Rf $TARGET || exit 1
rm -Rf $CURRENT_REPO_SLUG || exit 1

echo "Deployed successfully."  
exit 0