require 'rails_helper'

describe "Top items by revenue api" do
  it "sends a list of top items" do
  items = create_list(:item, 5)
  items.each do |item|
    5.times do
      create(:item_order, item: item)
    end
  end
  get "http://localhost:3000/api/v1/top_items", headers: { 'Authorization' => %{Token token="#{ENV['API_KEY']}"}}

  top_items = JSON.parse(response.body)

  expect(response).to be_success
  expect(top_items.count).to eq(5)
  end
end
