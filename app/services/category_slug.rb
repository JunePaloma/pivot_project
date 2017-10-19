class SlugCreator


  def initialize(slug)
    @slug = slug
  end


  private
    attr_reader :slug

    def generate_slug
      self.slug = name.parameterize if slug.nil
    end
end
