class CategorySlug


  def initialize(slug)
    @slug = slug
  end

  def execute
    Category.update(slug: generate_slug)
  end


  private
    attr_reader :slug

    def generate_slug
      self.slug = name.parameterize if slug.nil
    end
end
