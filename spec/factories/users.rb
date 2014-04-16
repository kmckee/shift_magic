# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "someone@nowhere.com"
    password "password1234"
    password_confirmation "password1234"
  end
end
