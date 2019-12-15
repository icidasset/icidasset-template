const identity = null
const isProduction = process.env.NODE_ENV === "production"


module.exports = {
  plugins: [

    require("postcss-import"),
    require("tailwindcss")("icidasset-template/Css/Tailwind.js"),
    require("postcss-nesting"),
    require("autoprefixer"),

    // Optimize
    // --------

    // 1. Purge Css

    isProduction

    ? require("@fullhuman/postcss-purgecss")({
      content: [ "build/**/*.html", "**/*.elm" ],
      css: [ "build/*.css" ],
      defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
    })

    : identity,

    // 2. Minify Css

    isProduction
    ? require("postcss-csso")
    : identity,

  ]
}
