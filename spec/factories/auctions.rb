# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'


FactoryGirl.define do
  factory :auction do
    title { Faker::Company.bs }
    details { Faker::Lorem.paragraph(2) }
    ends_on "2014-07-09 10:33:02"
    reserve_price [100,200,50,20,400].sample
    user
  end
end
