class Item < ApplicationRecord
  has_many :item_orders
  has_many :orders, through: :item_orders
  belongs_to :store
  has_many :category_items
  has_many :categories, through: :category_items

  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: :true, uniqueness: :true
  validates :description, :price, presence: :true

  def self.random_item
    find(rand(1..12))
  end
end
