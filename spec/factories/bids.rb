# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bid do
    amount [50,53,555,1000,72,43,5].sample
    user
    auction
  end
end
