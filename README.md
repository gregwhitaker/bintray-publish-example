# bintray-publish-example
[![Build Status](https://travis-ci.org/gregwhitaker/bintray-publish-example.svg?branch=master)](https://travis-ci.org/gregwhitaker/bintray-publish-example)

An example of publishing a multi-module Gradle build to [Bintray](https://bintray.com/) and syncing the published artifacts to [Maven Central](https://search.maven.org/).

## Building the Example
Run the following command to build the example:

    ./gradlew clean build
    
## Publishing the Example
The example is setup to publish automatically, via [TravisCI](https://travis-ci.org/), when you create a release tag on the master branch.

The first publish will always fail as there is no way to sync to Maven Central without first syncing the Bintray repository with JCenter. After the first
failed publish, login to Bintray and click the "Sync with JCenter" button in each of the repositories you are trying to publish. Once Bintray support has
approved the request you should be able to sync with Maven Central.

If you want to publish locally, run the following command:

    ./gradlew -PbintrayUser="bintrayUsername" -PbintrayKey="bintrayKey" \
              -PsonatypeUser="sonatypeUsername" -PsonatypePassword="sonatypePassword" \
              clean build bintrayUpload --stacktrace

## Bugs and Feedback
For bugs, questions, and discussions please use the [Github Issues](https://github.com/gregwhitaker/bintray-publish-example/issues).

## License
MIT License

Copyright (c) 2018 Greg Whitaker

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.