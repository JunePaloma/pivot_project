require 'rails_helper'
Capybara.javascript_driver = :webkit

feature "visitor can create account" do
  scenario "visitor can create an account and check out" do
    item = create(:item)

    visit '/items'

    click_on "add_shopping_cart"

    click_on "shopping_cart"

    expect(page).to have_button("To checkout login or create an account")

    click_on "To checkout login or create an account"

    click_on "Sign Up For An Account"

    fill_in "user[username]", with: "Charlie"
    fill_in "user[name]", with: "Chuck"
    fill_in "user[email]", with: "charlie@charlie.com"
    fill_in "user[phone]", with: "5555555555"
    fill_in "user[password]", with: "I love the waitress"
    fill_in "user[password_confirmation]", with: "I love the waitress"

    click_on "Create Account"

    click_on "shopping_cart"

    click_on "Checkout"


    order_item = User.first.orders.first.items.first
    user_orders = User.first.orders
    user_order = User.first.orders.first

    expect(current_path).to eq(orders_path)
    expect(user_orders.count).to eq(1)
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_link(user_order.id)
  end
  scenario "user can't check out with an empty cart" do
    visit '/'

    click_on "shopping_cart"

    click_on "To checkout login or create an account"

    click_on "Sign Up For An Account"

    fill_in "user[username]", with: "Charlie"
    fill_in "user[name]", with: "Chuck"
    fill_in "user[email]", with: "charlie@charlie.com"
    fill_in "user[phone]", with: "5555555555"
    fill_in "user[password]", with: "I love the waitress"
    fill_in "user[password_confirmation]", with: "I love the waitress"

    click_on "Create Account"

    click_on "shopping_cart"

    click_on "Checkout"

    expect(page).to have_content("CART EMPTY FILL IT WITH GARBAGE")
  end
end
