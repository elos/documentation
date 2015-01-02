Testing with [Ginkgo](https://github.com/onsi/ginkgo)
-----------------------------------------------------

We use the BDD testing framework [Ginkgo](https://github.com/onsi/ginkgo), with the preferred pattern matcher [Gomega](https://github.com/onsi/gomega).

The [Ginkgo documentation](http://onsi.github.io/ginkgo/) is extremely clear and helpful. We only include highlights here.

Installing Ginkgo & Gomega
--------------------------

```bash

go get github.com/onsi/ginkgo/ginkgo  # installs Ginkgo CLI
go get github.com/onsi/gomega         # fetches Gomege matcher lib

```

Setting up Tests for a Package
------------------------------

```bash

cd path/to/package           # should be the directory you want to test

ginkgo bootstrap [--nodot]   # sets up a new ginkgo suite [optionally opt out of dot imports]

ginkgo generate <file_name>  # generates a new test file

```

Running Tests
-------------

Ginkgo hooks into Go's existing testing infrastructure allowing us to run a Ginkgo suite using go test.

```bash

go test # or
ginkgo

```

Useful Commands
---------------

```bash
ginkgo watch # watch for changes, this subcommand takes almost all flags
# [-r] recursively throughout sub-directories
# [depth=1] depth of dependency tree to watch, default: 1
# [-notify] triggers desktop notifications
# [-p] run tests in parallel
# [--randomizeAllSpecs] randomizes all specs, by default only does
```

On Dot Imports
--------------

Adding a dot before an import statement in go, such as:

```go
import (
    . "github.com/onsi/ginkgo"
    . "github.com/onsi/gomenga"

    "testing"
)
```

Will import that specified package at the top level namespace. Anything you would otherwise qualify with ginkgo.Func you may now simple refer to as Func. This is not idiomatic Go and elos does not ordinarily condone dot imports. But to define every helper and matcher is verbose and ultimately _less clear_.

Note: Go let's us define a package_test package along side our package, allowing us to encapsulate testing logic separately from the package logic. Dot imports are the conventional method of importing the package you wish to test:

```go
package util_test

import (
    . "github.com/elos/server/util"

    . "github.com/onsi/ginkgo"
    . "github.com/onsi/gomega"
)

```
