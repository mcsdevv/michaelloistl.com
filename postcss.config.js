module.exports = (ctx) => ({
  plugins: [
    require("postcss-import"),
    require("tailwindcss")("./_includes/tailwind.config.js"),
    require("autoprefixer"),
    ...(ctx.env != "development"
      ? [
          require("@fullhuman/postcss-purgecss")({
            content: ["!(_site|node_modules)/**/*.+(html|js|md)", "*.html"],
            whitelistPatternsChildren: [/highlight/],
            defaultExtractor: (content) =>
              content.match(/[\w-/:]+(?<!:)/g) || [],
          }),
          require("cssnano")({ preset: "default" }),
        ]
      : [])
  ]
});
