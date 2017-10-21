class StoreOperator < ApplicationRecord
  has_secure_password
  belongs_to :store
  enum role: ["manager", "admin"]
end
