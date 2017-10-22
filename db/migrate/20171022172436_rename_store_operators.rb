class RenameStoreOperators < ActiveRecord::Migration[5.1]
  def change
    rename_table :store_operators, :operators
  end
end
