# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :form do
    browser nil
    family_name "MyString"
    given_name "MyString"
    email "MyString"
    postal_code "MyString"
    address "MyString"
    inquiry "MyString"
  end
end
