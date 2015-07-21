FactoryGirl.define do
  factory :question do
    content {FFaker::Lorem.sentence}
    before :create do |question|
      Settings.question.minimum_answers.times do |i|
        question.answers << FactoryGirl.build(:answer, question: question,
          correct: i == 0)
      end
    end
  end
end
