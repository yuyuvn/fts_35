FactoryGirl.define do
  factory :category do
    name {FFaker::Lorem.sentence}
    max_time 100
  end
end
