#!/bin/bash

echo "Starting deployment" 
echo "Getting deployment target."

TARGET=$TARGET

echo "Getting source harp.js code from $TRAVIS_REPO_SLUG"
CURRENT_REPO_SLUG=$(echo $TRAVIS_REPO_SLUG | cut -d "/" -f2 )
CURRENT_COMMIT=`git rev-parse HEAD`

echo "Targeting $TARGET repository"
TARGET_URL=$TARGET_URL_CREDENTIALS

echo "Cloning repository from $TARGET"
cd ../
git clone $TARGET_URL || exit 1
cd $TARGET || exit 1

echo "Checking out dev from $TARGET"
git checkout dev || exit 1
cd ../

echo "Compiling new static content for $TARGET"
harp compile $CURRENT_REPO_SLUG $TARGET || exit 1
cd $TARGET