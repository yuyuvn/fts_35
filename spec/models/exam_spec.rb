require "rails_helper"

describe Exam do
  subject {FactoryGirl.create :exam}
  it {is_expected.to be_valid}

  describe "#results" do
    before {subject.results << FactoryGirl.create(:result, exam: subject)}
    it {expect{subject.destroy}.to change{Result.count}.by -1}
  end
end
