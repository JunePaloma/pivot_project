class CreateStoreOperators < ActiveRecord::Migration[5.1]
  def change
    create_table :store_operators do |t|
      t.string :name
      t.string :user_name
      t.references :store, foreign_key: true
      t.integer :role, default: 0
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
