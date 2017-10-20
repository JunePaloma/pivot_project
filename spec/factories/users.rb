FactoryGirl.define do
  factory :user do
    sequence(:username) do |i|
      "D#{i}"
    end
    name "Dennis"
    password "MyPassword"
    street "123 Main St"
    city "Aspen"
    state "California"
    country "Texas"
    zip_code "12311"
    phone ENV['TEST_NUMBER']
    verification_code "123456"
    email "email@email.com"

    factory :user_with_orders do
      after(:create) do |user|
        create_list(:order, 3, :user => user)
      end
    end
  end
end
