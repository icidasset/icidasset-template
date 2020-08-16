module.exports = {

  plugins: [],

  purge: [
    "../build/**/*.html",
    "../src/**/*.elm",
    "Elm/**/*.elm"
  ],

  theme: {

    // Fonts
    // -----

    fontFamily: {
      sans: '"Nunito Sans", sans-serif',
      serif: '"Playfair Display", serif',
      mono: 'Hack, Consolas, Menlo, Monaco, "Andale Mono WT", "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Liberation Mono", "Nimbus Mono L", "Courier New", Courier, monospace'
    },


    // Inset
    // -----

    inset: {
      "0": 0,
      "1/2": "50%",
      "full": "100%",
      "-px": "-1px"
    },


    // Extensions
    // ----------

    extend: {
      colors: {
        lightning: "hsl(29.2, 83.2%, 74.3%)"
      },

      screens: {
        "dark": { "raw": "(prefers-color-scheme: dark)" }
      }
    }

  },

  variants: {

    // Variants
    // --------

    borderRadius: [ "first", "last", "responsive" ],
    borderWidth: [ "first", "last", "responsive" ],
    margin: [ "first", "last", "responsive" ]

  }
}
