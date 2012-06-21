# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :redirect do
    code "MyString"
    default_redirect false
    medium_id 1
    target_id 1
  end
end
