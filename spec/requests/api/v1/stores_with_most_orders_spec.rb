require 'rails_helper'

describe "Most items sold by store API" do
  it "sends a list of stores" do
    stores = create_list(:store, 5)
    stores.each do |store|
      5.times do
        item = create(:item, store: store)
        order = create(:order, store: store)
        create(:item_order, item: item, order: order)
      end
    end

    get "http://localhost:3000/api/v1/stores_with_most_items_ordered", headers: { 'Authorization' => %{Token token="#{ENV['API_KEY']}"}}

    store_return = JSON.parse(response.body)

    expect(response).to be_success
    expect(store_return.count).to eq(5)

  end
end
