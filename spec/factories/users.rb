# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'


FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.password { Faker::Internet.password(10) }
  end
end
