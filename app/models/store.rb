class Store < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :items
  has_many :store_operators
  has_many :operators, through: :store_operators
  has_many :orders

  def find_orders
    items
    .select('orders.*')
    .joins(:orders)
    .where("items.store_id = #{self.id}")
  end

  def self.most_items_sold
    .joins(items[:item_orders])
    .select("Stores.*, count(stores.id) as total")
    .group(:id)
    .order("total desc")
    .first
  end
end
