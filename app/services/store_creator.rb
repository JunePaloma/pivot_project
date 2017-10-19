class StoreCreator
  def initialize(name, description)
    @name = name
    @description = description
  end

  def execute
    Store.create(name: name, description: description, slug: slug)
  end

  private
    attr_reader :name,
                :description

    def slug
      name.parameterize
    end
end
