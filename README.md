# Template

A generic template for my personal projects.



## How to use

### Setup

1. Add as git submodule to another project  
   `git submodule add ...`.
2. Fetch submodule updates by either going into the submodule
   directory and running `git pull origin master` or you could run
   `git submodule update --remote icidasset-template` in the root directory.


### Haskell

1. Add `./icidasset-template` to `packages` in the `stack.yaml` file.
3. Use the Haskell modules as normal.


### Css

1. Add `"icidasset-template": "file:./icidasset-template"` dependency to `package.json` in the root directory.
2. Import the template css file (e.g. `@import "PATHTOROOT/icidasset-template/css/index"`)
