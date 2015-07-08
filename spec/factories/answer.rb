FactoryGirl.define do
  factory :answer do
    content {FFaker::Lorem.sentence}
  end
end
