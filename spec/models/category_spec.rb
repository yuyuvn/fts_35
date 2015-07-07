require "rails_helper"

describe Category do
  subject {FactoryGirl.create :category}
  it {is_expected.to be_valid}

  describe "#name" do
    before {subject.name = nil}
    it {is_expected.to have_exactly(1).errors_on :name}
  end

  describe "#max_time" do
    context "when max_time is not presenced" do
      before {subject.max_time = nil}
      it {is_expected.to have_exactly(2).errors_on :max_time}
    end

    context "when max_time smaller or equal than 0" do
      before {subject.max_time = 0}
      it {is_expected.to have_exactly(1).errors_on :max_time}
    end
  end

  describe "#exams" do
    before {subject.exams << FactoryGirl.create(:exam, category: subject)}
    it {expect{subject.destroy}.to change{Exam.count}.by -1}
  end

  describe "#questions" do
    before {subject.questions << FactoryGirl.create(:question, category: subject)}
    it {expect{subject.destroy}.to change{Question.count}.by -1}
  end
end
