#!/bin/bash

ENV="dev"

echo "Starting $ENV deployment." 
echo "Getting deployment target."

echo "Getting source harp.js code from $TRAVIS_REPO_SLUG"
CURRENT_REPO_SLUG=$(echo $TRAVIS_REPO_SLUG | cut -d "/" -f2 )
CURRENT_COMMIT=`git rev-parse HEAD`

echo "Targeting $TARGET repository"

echo "Cloning repository from $TARGET"
cd ../
git clone $TARGET_URL_CREDENTIALS || exit 1
cd $TARGET || exit 1
ls || exit 1

echo "Checking out $ENV from $TARGET"
git checkout $ENV || exit 1
ls || exit 1
cd ../

echo "Compiling new static content for $TARGET_URL_CREDENTIALS"
harp compile $CURRENT_REPO_SLUG $TARGET || exit 1
cd $TARGET
ls || exit 1

echo "Commit updates"
git add -A || exit 1
git commit --allow-empty -m "Compiled content for $CURRENT_COMMIT" || exit 1

echo "Pushing updates"
git push origin $ENV --force --quiet || exit 1

cd ../

echo "Cleaning up temp files"  
rm -Rf $TARGET || exit 1
rm -Rf $CURRENT_REPO_SLUG || exit 1

echo "Deployed successfully."  
exit 0