FactoryBot.define do
  factory :weapon do
    name { FFaker::Name.first_name } 
    description { FFaker::Book.description }
    power_base { 3000 } 
    power_step { 100 } 
    level { FFaker::Random.rand(1..99) } 
  end
end
