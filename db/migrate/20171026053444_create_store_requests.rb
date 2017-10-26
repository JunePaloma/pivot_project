class CreateStoreRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :store_requests do |t|
      t.string :name
      t.string :description
      t.integer :status, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
