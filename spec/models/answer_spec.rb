require "rails_helper"

describe Answer do
  subject {FactoryGirl.create :answer, question: question}
  let (:question){FactoryGirl.create :question}
  it {is_expected.to be_valid}

  describe "#content" do
    context "when content is not presenced" do
      before {subject.content = nil}
      it {is_expected.to have_exactly(1).errors_on :content}
    end

    context "when duplicate answer per question" do
      let :another_answer do
        FactoryGirl.build :answer, question: question, content: subject.content
      end
      it {expect(another_answer).to have_exactly(1).errors_on :content}
    end
  end

  describe "#results" do
    before {subject.results << FactoryGirl.create(:result, answer: subject)}
    it {expect{subject.destroy}.to change{Result.count}.by -1}
  end
end
