const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  purge: {
    enabled: true,
    content: [
      './_site/**/*.html',
    ],
  },
  future: {
    removeDeprecatedGapUtilities: true,
    purgeLayersByDefault: true,
    defaultLineHeights: true,
    standardFontWeights: true,
  },
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
    typography: {
      default: {
        css: {
          a: {
            color: '#1a202c',
            'font-weight': '600',
            '&:hover': {
              color: '#1a202c',
            },
          },
          blockquote: {
            'font-weight': '500',
            'font-style': 'italic',
            color: '#111827',
            'border-left-width': '0.25rem',
            'border-left-color': '#E5E7EB',
            quotes: '"\\201C""\\201D""\\2018""\\2019"',
          },
          'blockquote p:first-of-type::before': {
            content: 'open-quote',
          },
          'blockquote p:last-of-type::after': {
            content: 'close-quote',
          },
        },
      },
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/ui'),
    require('@tailwindcss/typography'),
  ],
};
