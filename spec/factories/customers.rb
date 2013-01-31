# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    family_name "Family"
    given_name "Given"
    email "test@example.com"
    postal_code "000-0000"
    address "Somewhere"
    inquiry({'inquiry1' => 'question 1', 'inquiry2' => 'question 2'}.to_json)
    browser nil
  end
end
