FactoryGirl.define do
  factory :answer do
    content {FFaker::Lorem.sentence}

    factory :correct_answer do
      correct true
    end
  end
end
