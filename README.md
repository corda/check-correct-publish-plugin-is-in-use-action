# Check if correct publish plugin is in use

Makes sure Gradle project doesn't use `com.r3.internal.gradle.plugins.r3Publish` Gradle plugin
for publishing, as this is tied to internal R3 infrastructure.

Instead `corda.common-publishing` should be used, but this action doesn't check that.

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
