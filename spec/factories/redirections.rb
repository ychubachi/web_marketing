# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :redirection do
    code "1"
    is_default false
    medium_id 0
    target_id 0
  end
end
