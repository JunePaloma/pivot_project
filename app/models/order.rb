class Order < ApplicationRecord
  belongs_to :store, optional: true
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders

  enum status: ["ordered", "paid", "cancelled", "completed"]

  scope :ordered, -> { where(status: "ordered")}
  scope :paid, -> { where(status: "paid")}
  scope :cancelled, -> { where(status: "cancelled")}
  scope :completed, -> { where(status: "completed")}

  def self.create_from_items(items, current_user)
    fake_order = Order.new
    items_by_store = fake_order.create_items_by_store(items)
    items_by_store.each do |store, items|
      order = Order.create(user_id: current_user.id, store_id: store)
      items.each do |item, quantity|
        quantity.times do
          order.items << item
        end
      end
    end
  end

  def total_price
    total_price = 0
    self.items.each do |item|
      total_price += item.price * item_count(item.id)
    end
    total_price
  end

  def item_count(item_id)
    ItemOrder.where(order_id: self.id, item_id: item_id).count
  end

  def item_subtotal(item_id)
    Item.find(item_id).price * item_count(item_id)
  end

  def unique_items
    items.uniq
  end

  def create_items_by_store(items)
    items_by_store = {}
    items.each do |item, quantity|
      items_by_store[item.store_id] = {item => quantity} if items_by_store[item.store_id].nil?
      items_by_store[item.store_id].merge!({item => quantity}) if items_by_store[item.store_id]
    end
    items_by_store
  end

  def self.filter_orders_by_store(status, store_id, page)
    if status == "all"
      Order.where(store_id: store_id).paginate(:page => page, :per_page => 10)
    elsif status == "completed"
      Order.completed.where(store_id: store_id).paginate(:page => page, :per_page => 10)
    elsif status == "paid"
      Order.paid.where(store_id: store_id).paginate(:page => page, :per_page => 10)
    elsif status == "cancelled"
      Order.cancelled.where(store_id: store_id).paginate(:page => page, :per_page => 10)
    elsif status == "ordered"
      Order.ordered.where(store_id: store_id).paginate(:page => page, :per_page => 10)
    else
      Order.where(store_id: store_id).paginate(:page => page, :per_page => 10)
    end
  end
end
