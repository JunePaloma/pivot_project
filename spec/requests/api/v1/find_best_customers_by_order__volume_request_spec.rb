require 'rails_helper'

describe "Top customers by volume of orders api" do
  it "sends a list of customers" do
    users = create_list(:user, 5)
    users.each do |user|
      5.times do
        item = create(:item)
        order = create(:order, user: user)
        create(:item_order, item: item, order: order)
      end
    end
    get "http://localhost:3000/api/v1/customers_with_most_orders", headers: { 'Authorization' => %{Token token="#{ENV['API_KEY']}"}}

    shoppers = JSON.parse(response.body)

    expect(response).to be_success
    expect(shoppers.count).to eq(5)
  end
end
