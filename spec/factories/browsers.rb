# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :browser do
    uuid "test_browser_uuid"
    user_agent "test_browser_user_agent"
  end
end
