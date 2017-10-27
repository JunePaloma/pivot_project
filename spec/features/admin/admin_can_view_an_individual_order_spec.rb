require 'rails_helper'

feature "as a logged in admin" do
  scenario "I can view an individual order" do
    admin   = create(:operator)
    allow_any_instance_of(ApplicationController).to receive(:current_operator).and_return(admin)

    user1 = create(:user, name: 'Aaron')
    store = create(:store)
    StoreOperator.create(operator: admin, store: store)
    order1 = create(:order, store: store, user: user1)
    order2 = create(:order, store: store, user: user1)

    user1.orders.each do |order|
      order.items << create_list(:item, 3, store: store)
    end
    visit admin_stores_path
    click_on store.name

    click_on "Order: #{user1.orders.first.id}"

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user1.address)
    expect(page).to have_content(user1.orders.first.created_at.to_formatted_s(:long_ordinal))
    expect(page).to have_link(user1.orders.first.items.first.name)
    expect(page).to have_content(user1.orders.first.items.count)
    expect(page).to have_content(user1.orders.first.items.first.price)
    expect(page).to have_content(user1.orders.first.items.second.price)
    expect(page).to have_content(user1.orders.first.items.third.price)
    expect(page).to have_content("$150.00")
    expect(page).to have_content("$50.00")
    expect(page).to have_content(user1.orders.first.status.humanize)
  end
end
