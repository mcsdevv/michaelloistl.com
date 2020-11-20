module Jekyll
  class CategoryKeys <  Generator
    safe true

    def generate(site)
      site.config['category_keys'] = site.categories.keys
    end
  end
end
