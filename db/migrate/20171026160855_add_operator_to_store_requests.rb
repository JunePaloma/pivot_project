class AddOperatorToStoreRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :store_requests, :operator, foreign_key: true
  end
end
