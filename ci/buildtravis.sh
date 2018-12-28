#!/usr/bin/env bash

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then

    echo -e "Building PR #$TRAVIS_PULL_REQUEST [$TRAVIS_PULL_REQUEST_SLUG/$TRAVIS_PULL_REQUEST_BRANCH => $TRAVIS_REPO_SLUG/$TRAVIS_BRANCH]"
    ./gradlew clean build

elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "" ] && [ "$bintrayUser" != "" ] ; then

    echo -e "Building Snapshot $TRAVIS_REPO_SLUG/$TRAVIS_BRANCH"
    ./gradlew clean build

elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" != "" ] && [ "$bintrayUser" != "" ] ; then

    echo -e "Building Tag $TRAVIS_REPO_SLUG/$TRAVIS_TAG"
    ./gradlew \
        -Pversion="$TRAVIS_TAG" \
        -PbintrayUser="${bintrayUser}" -PbintrayKey="${bintrayKey}" \
        -PsonatypeUsername="${sonatypeUser}" -PsonatypePassword="${sonatypePassword}" \
        clean build bintrayUpload --stacktrace

else

    echo -e "Building $TRAVIS_REPO_SLUG/$TRAVIS_BRANCH"
    ./gradlew clean build

fi
