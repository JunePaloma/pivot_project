class RemoveStoreIdFromStoreOperators < ActiveRecord::Migration[5.1]
  def change
    remove_reference :store_operators, :store, foreign_key: true
  end
end
