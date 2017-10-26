class StoreRequestConverter

  def initialize(request)
    @request        = request
    @name           = request.name
    @description    = request.description
    @attached_user  = request.user
  end

  def declined
    return true if request.declined!
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