FactoryGirl.define do
  factory :question do
    content {FFaker::Lorem.sentence}
    before :create do |question|
      4.times do |i|
        question.answers << FactoryGirl.build(:answer, question: question,
          correct: i == 0)
      end
    end
  end
end
