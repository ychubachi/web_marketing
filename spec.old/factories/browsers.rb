# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :browser do
    uuid "MyString"
    user_agent "MyString"
  end
end
