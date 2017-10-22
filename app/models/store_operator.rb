class StoreOperator < ApplicationRecord
  has_secure_password
  belongs_to :store
  enum role: ["manager", "admin"]

  def store_admin?
    self.role == "admin"
  end
end
