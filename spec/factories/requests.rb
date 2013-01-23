# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    referrer "http://referrer.com/"
    action {FactoryGirl.create(:action)}
    browser {FactoryGirl.create(:browser)}
  end
end
