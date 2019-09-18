module.exports = {
  theme: {

    // Fonts
    // -----

    fontFamily: {
      sans: '"Nunito Sans", sans-serif',
      serif: '"Playfair Display", serif',
      mono: 'Hack, Consolas, Menlo, Monaco, "Andale Mono WT", "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Liberation Mono", "Nimbus Mono L", "Courier New", Courier, monospace'
    },


    // Colors
    // ------
    // Extend default Tailwind color palette

    extend: {
      colors: {
        lightning: "hsl(29.2, 83.2%, 74.3%)"
      }
    }

  },
  variants: {

    // Variants
    // --------

    margin: [ "first", "last", "responsive" ]

  }
}
