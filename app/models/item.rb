class Item < ApplicationRecord
  belongs_to :category, optional: true
  has_many :item_orders
  has_many :orders, through: :item_orders
  belongs_to :store, optional: true
  has_many :category_items
  has_many :categories, through: :category_items

  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: :true, uniqueness: :true
  validates :description, :price, presence: :true

  def self.random_item
    find(rand(1..12))
  end

  def self.top_items(quantity=nil)
    Item.select('items.*, sum(item_orders.item_id * items.price) as sum')
      .joins(:item_orders)
      .group(:id)
      .order("sum desc")
      .limit(quantity)
  end
end
