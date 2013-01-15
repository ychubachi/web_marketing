# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    family_name "MyString"
    given_name "MyString"
    email "MyString"
    postal_code "MyString"
    address "MyString"
    string "MyString"
    comment "MyString"
    browser_id 1
  end
end
