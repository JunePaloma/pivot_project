class Store < ApplicationRecord
  has_many :items
  has_many :store_operators
  has_many :operators, through: :store_operators

  def find_orders
    items.select('orders.*').joins(:orders).where("items.store_id = #{self.id}")
  end
end
