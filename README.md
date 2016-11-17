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

1. Add `icidasset-template/haskell` to `hs-source-dirs` in the cabal file.
2. Add dependencies to the cabal file.
3. Use the Haskell modules as normal.


### Css

1. Add dependencies to `package.json` in the root directory (see dependencies below).
2. Import the template css file (e.g. `@import "PATHTOROOT/icidasset-template/css/index.css"`)

#### Dependencies

```json
{
  "normalize.css": "~> 5.0.0",
  "postcss": "~> 5.2.5",
  "postcss-cssnext": "~> 2.8.0",
  "postcss-custom-units": "~> 0.1.1",
  "postcss-import": "~> 8.2.0",
  "postcss-mixins": "~> 5.4.0",
  "postcss-remify": "~> 1.0.1",
  "postcss-simple-vars": "~> 3.0.0",
}
```
