#!/usr/bin/env bash
set -eu
# there is one place mentioning of that plugin is allowed
# `buildSrc/src/main/groovy/corda.common-publishing.gradle``

echo "Search: $(grep -ril com.r3.internal.gradle.plugins.r3Publish)"

if [ $(grep -ril com.r3.internal.gradle.plugins.r3Publish | wc -l) -gt 1 ]
then
    echo "com.r3.internal.gradle.plugins.r3Publish has been used by mistake!"
    echo "Please replace it with corda.common-publishing"
    exit 1
fi
