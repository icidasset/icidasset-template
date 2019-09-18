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

Compile the CSS using `tailwind`.

```shell
./node_modules/.bin/tailwind \
    build "icidasset-template/Css/Main.css" \
    --config "icidasset-template/Css/Tailwind.js" \
    --output "${BUILD_DIR}/stylesheet.css"
```




## Notes

### Haskell

- Uses dot syntax for records (see https://hackage.haskell.org/package/record-dot-preprocessor for more info)
