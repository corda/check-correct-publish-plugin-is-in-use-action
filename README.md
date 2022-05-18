# Check if correct publish Gradle plugin is in use

Makes sure Gradle project doesn't use `com.r3.internal.gradle.plugins.r3Publish`
Gradle plugin for publishing, as this is tied to internal R3 infrastructure.

Instead `corda.common-publishing` should be used, but this action doesn't
check that.

## How to use it

Create a Github Action and add a step like this

```yaml

name: <NAME OF THE ACTIONS>

on:
  push:
    branches: [ BRANCHES ]
  pull_request:
    branches: [ BRANCHES ]

permissions:
  contents: read

jobs:
  check:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - uses: wzur-r3/check-correct-publish-plugin-is-in-use-action@v1
```

## Versioning

Versioning for this projects follows [semantic versioning](https://semver.org/).
For each version a tag is created with `v` prefix, ie:

* version `1.0.0` has tag `v1.0.0`
* version `1.0.1` has tag `v1.0.1`

and so on.

Additionally, another tag with for the release major version should always track
the latest release, ie:

* `v1` should point to the same point as the latest of `v1.x.x` tag
* `v2` should point to the same point as the latest of `v2.x.x` tag

and so on. That was any backward compatibile changes to this action are
automatically applied if a step uses `v1` tag, for example.
