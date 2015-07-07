require "rails_helper"

describe Question do
  subject {FactoryGirl.create :question}
  it {is_expected.to be_valid}

  describe "#answers" do
    before {subject.answers << FactoryGirl.create(:answer, question: subject)}
    it {expect{subject.destroy}.to change{Answer.count}.by -5}

    context "when answers number is smaller than 4" do
      subject {FactoryGirl.build :question}
      it {is_expected.to have_exactly(1).errors_on :answers}
    end

    context "when correct answers number is not equal 1" do
      subject {FactoryGirl.build :question}
      before {2.times{subject.answers << FactoryGirl.build(:correct_answer)}}
      it {is_expected.to have_exactly(1).errors_on :answers}
    end
  end

  describe "#results" do
    before {subject.results << FactoryGirl.create(:result, question: subject)}
    it {expect{subject.destroy}.to change{Result.count}.by -1}
  end

  describe "#content" do
    before {subject.content = nil}
    it {is_expected.to have_exactly(1).errors_on :content}
  end
end
