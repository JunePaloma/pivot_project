class StoreOperator < ApplicationRecord
  belongs_to :store
  enum role: ["manager", "admin"]
end
