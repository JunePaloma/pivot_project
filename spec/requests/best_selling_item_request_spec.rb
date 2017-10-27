require 'rails_helper'

describe 'Item' do
  it '.top_items returns best selling items' do
    store  = create(:store)
    item1     = create(:item, store_id: store.id, price: 50.0)
    item2     = create(:item, store_id: store.id, price: 25.0)
    item3     = create(:item, store_id: store.id, price: 5.0)
    inv1      = create(:order, status: 'completed')
    inv2      = create(:order, status: 'completed')
    inv3      = create(:order, status: 'completed')
    inv_item1 = create(:item_order, order_id: inv1.id)
    inv_item2 = create(:item_order, order_id: inv1.id)
    inv_item3 = create(:item_order, order_id: inv1.id)

    get '/api/v1/items/most_revenue?quantity=2', headers: { 'Authorization': %{Token token="#{ENV['API_KEY']}"}}

    expect(response).to be_success

    top_items = JSON.parse(response.body)

    expect(top_items.count).to eq(2)
  end
end
