require 'rails_helper'

feature "as a logged in admin" do
  scenario "I can view orders on the dashboard" do
    admin   = create(:operator)

    allow_any_instance_of(ApplicationController).to receive(
    :current_operator).and_return(admin)

    user1 = create(:user, name: 'Aaron')
    store = create(:store)
    StoreOperator.create(operator: admin, store: store)
    order1 = create(:order, store: store, user: user1, status: "cancelled")
    order2 = create(:order, store: store, user: user1, status: "completed")

    user1.orders.each do |order|
      order.items << create_list(:item, 3)
    end

    user2 = create(:user, name: 'Kali')

    StoreOperator.create(operator: admin, store: store)
    order3 = create(:order, store: store, user: user2, status: "paid")
    order4 = create(:order, store: store, user: user2)

    user2.orders.each do |order|
      order.items << create_list(:item, 3, store: store)
    end

    visit admin_stores_path
    click_on store.name

    expect(page).to have_link("Order: #{user1.orders.first.id}")
    expect(page).to have_link("Order: #{user2.orders.first.id}")
    expect(page).to have_content("Ordered: 1")
    expect(page).to have_content("Cancelled: 1")
    expect(page).to have_content("Paid: 1")
    expect(page).to have_content("Completed: 1")
  end

  scenario "I can filter the orders on the dashboard page" do
    admin   = create(:operator)
    allow_any_instance_of(ApplicationController).to receive(:current_operator).and_return(admin)

    user1 = create(:user, name: 'Aaron')
    store = create(:store)
    StoreOperator.create(operator: admin, store: store)
    order1 = create(:order, store: store, user: user1, status: "cancelled")
    order2 = create(:order, store: store, user: user1, status: "completed")

    user1.orders.each do |order|
      order.items << create_list(:item, 3, store: store)
    end

    user2 = create(:user, name: 'Kali')

    StoreOperator.create(operator: admin, store: store)
    order3 = create(:order, store: store, user: user2, status: "paid")
    order4 = create(:order, store: store, user: user2)

    visit admin_store_dashboard_index_path(store, order_status: "cancelled")

    expect(page).to_not have_content("Order: #{user1.orders.last.id}")
    expect(page).to have_content("Order: #{user1.orders.first.id}")

    visit admin_store_dashboard_index_path(store, order_status: "completed")

    expect(page).to_not have_content("Order: #{user1.orders.first.id}")
    expect(page).to have_content("Order: #{user1.orders.last.id}")
    expect(page).to_not have_content("Order: #{user2.orders.last.id}")

    visit admin_store_dashboard_index_path(store, order_status: "paid")

    expect(page).to_not have_content("Order: #{user1.orders.first.id}")
    expect(page).to have_content("Order: #{user2.orders.first.id}")
    expect(page).to_not have_content("Order: #{user1.orders.last.id}")

    visit admin_store_dashboard_index_path(store, order_status: "ordered")

    expect(page).to have_content("Order: #{user2.orders.last.id}")
    expect(page).to_not have_content("Order: #{user2.orders.first.id}")
    expect(page).to_not have_content("Order: #{user1.orders.first.id}")

    visit admin_store_dashboard_index_path(store, order_status: "all")

    expect(page).to have_content("Order: #{user1.orders.first.id}")
    expect(page).to have_content("Order: #{user2.orders.last.id}")
    expect(page).to have_content("Order: #{user1.orders.last.id}")
  end

  scenario "I can change the status of the order" do
    admin   = create(:operator)
    allow_any_instance_of(ApplicationController).to receive(:current_operator).and_return(admin)

    user1 = create(:user, name: 'Aaron')
    store = create(:store)
    StoreOperator.create(operator: admin, store: store)
    order1 = create(:order, store: store, user: user1, status: "paid")
    order2 = create(:order, store: store, user: user1)
    order3 = create(:order, store: store, user: user1)
    order4 = create(:order, store: store, user: user1, status: "paid")


    user1.orders.each do |order|
      order.items << create_list(:item, 3, store: store)
    end

    visit admin_stores_path

    click_on store.name

    expect(page).to have_button("Cancel")
    expect(page).to have_button("Mark as Paid")
    expect(page).to have_button("Mark as Completed")

    within(".order#{order1.id}") do
      click_on "Mark as Completed", :match => :first
    end

    expect(Order.find(order1.id).status).to eq("completed")

    within(".order#{order2.id}") do
      click_on "Cancel", :match => :first
    end

    expect(Order.find(order2.id).status).to eq("cancelled")

    within(".order#{order3.id}") do
      click_on "Mark as Paid", :match => :first
    end

    expect(Order.find(order3.id).status).to eq("paid")

    within(".order#{order3.id}") do
      click_on "Cancel", :match => :first
    end

    expect(Order.find(order3.id).status).to eq("cancelled")
  end


end
