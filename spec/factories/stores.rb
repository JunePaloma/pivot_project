FactoryGirl.define do
  factory :store do
    sequence :name do |n|
      "#{n}MyName"
    end
    sequence :slug do |x|
      "#{x}-my-name"
    end
    # slug "MyName"
    description "MyDescription"
  end
end
