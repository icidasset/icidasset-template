# Template

A generic template for my personal projects.



## How to use

### Setup

1. Add as a git submodule to another project  
   `git submodule add ...`.
2. Fetch submodule updates by either going into the submodule
   directory and running `git pull origin master` or you could run
   `git submodule update --remote icidasset-template` in the root directory.


### Haskell

1. Add `./icidasset-template` to `packages` in the `stack.yaml` file.
2. Use the Haskell modules as normal.


### Elm

1. Add `icidasset-template/Elm` to `source-directories` in the `elm.json` file.
2. Use the Elm modules as normal.


### Css

1. Add the `"icidasset-template": "file:./icidasset-template"` dependency to `package.json` in the root directory.
2. Import the template-css file (e.g. `@import "PATH_TO_ROOT/icidasset-template/Css/Core"`).
3. Use `postcss-cli` to compile your css file.

```shell
@./node_modules/.bin/postcss \
  "src/Css/Main.css" \
  --output "build/application.css" \
  --config "icidasset-template/Css/"
```




## Notes

### Haskell

- Uses dot syntax for records (see https://hackage.haskell.org/package/record-dot-preprocessor for more info)
