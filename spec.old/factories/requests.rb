# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    referred "MyString"
    env "MyString"
    action_id 1
  end
end
