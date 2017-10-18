FactoryGirl.define do
  factory :store do
    name "MyString"
    slug "MyString"
    description "MyString"
  end

  factory :store_with_items do
    after(:create) do |store|
      create_list(:item, 5 ,:store => store)
    end
  end
end
