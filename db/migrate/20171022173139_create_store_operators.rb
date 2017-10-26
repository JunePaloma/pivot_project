class CreateStoreOperators < ActiveRecord::Migration[5.1]
  def change
    create_table :store_operators do |t|
      t.references :store, foreign_key: true
      t.references :operator, foreign_key: true

      t.timestamps
    end
  end
end
