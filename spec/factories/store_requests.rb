FactoryGirl.define do
  factory :store_request do
    sequence :name do |n|
      "#{n}store_request_name"
    end
    sequence :description do |x|
      "#{x}store_request_description"
    end
    status 0
    user nil
    operator nil
  end
end