const identity = null
const isProduction = process.env.NODE_ENV === "production"


module.exports = {
  plugins: [

    require("postcss-import"),
    require("tailwindcss")("./Css/Tailwind.js"),
    require("postcss-nesting"),
    require("autoprefixer"),

    // Optimize
    // --------

    isProduction
    ? require("postcss-csso")
    : identity,

  ]
}
