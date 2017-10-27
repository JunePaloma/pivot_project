require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_numericality_of :price }
  end

  context "associations" do
    it { should have_many :item_orders }
    it { should have_many(:orders).through(:item_orders) }
  end

  context "Class Methods" do
    it "::can returns random items" do
    x = 1
    category = create(:category)
    store = create(:store)

      12.times do
        Item.create!(id: x, name: "couch#{x}", description: "The thing", price: 5.00, category: category, store: store)
        x += 1
      end

    item = Item.random_item

    expect(item.class).to eq(Item)
    end

    it 'returns list of items ranked by revenue' do
      store = create(:store)
      store.orders = create_list(:order, 3)

      store.orders.each do |order|
        order.items << create(:item)
      end

      top_earners = Item.top_items(2)

      expect(top_earners.length).to eq(2)
      expect(top_earners[0].price).to eq(50.0)
    end
  end

  context "Instance Methods" do
    it "::can return item subtotal" do
      user = create(:user_with_orders)
      item1 = create(:item)

      user.orders.first.items << [item1, item1]

      expect(user.orders.first.item_subtotal(item1.id)).to eq(100.0)
    end
  end

end
