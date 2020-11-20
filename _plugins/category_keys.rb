module Jekyll
  class CategoryKeys <  Generator
    def generate(site)
      site.config['category_keys'] = site.categories.keys
    end
  end
end
