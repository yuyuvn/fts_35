require "rails_helper"

describe Result do
  subject {FactoryGirl.create :result}
  it {is_expected.to be_valid}

  describe "#correct?" do
    context "when correct is true" do
      before {subject.answer = FactoryGirl.create :correct_answer}
      it {expect(subject.correct?).to be true}
    end

    context "when correct is false" do
      before {subject.answer = FactoryGirl.create :answer}
      it {expect(subject.correct?).to be false}
    end
  end
end
