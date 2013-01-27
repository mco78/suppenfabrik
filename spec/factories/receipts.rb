# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :receipt do
    text "MyText"
    pre_tax "9.99"
    tax "9.99"
    after_tax "9.99"
    user_id 1
    store_id 1
    checkout_id 1
    date "2013-01-27"
  end
end
