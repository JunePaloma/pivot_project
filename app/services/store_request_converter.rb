class StoreRequestConverter

  def initialize(request)
    @request        = request
    @name           = request.name
    @description    = request.description
    @attached_user  = request.user || request.operator
  end

  def declined
    return true if request.declined!
  end

  def approved
    store = Store.new(name: name, description: description, slug: slug)
    if store.save
      request.approved!
      return true
    end
  end

  private

  attr_reader :name,
              :description,
              :attached_user,
              :request

  def slug
    name.parameterize
  end
end