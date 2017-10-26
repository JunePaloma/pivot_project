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

  def approved
    store = Store.new(name: name, description: description, slug: slug)
    if store.save
      upgrade_user(store)
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

  def upgrade_user(store)
    op = Operator.create(name: attached_user.name,
                    user_name: attached_user.username,
                    email: attached_user.email,
                    password_digest: attached_user.password_digest)
    link_to_store(store, op)
  end

  def link_to_store(store, operator)
    StoreOperator.create(store_id: store.id, operator_id: operator.id)
  end

end