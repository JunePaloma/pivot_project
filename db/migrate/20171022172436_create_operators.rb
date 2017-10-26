class CreateOperators < ActiveRecord::Migration[5.1]
  def change
    create_table :operators do |t|
      t.string :name
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
