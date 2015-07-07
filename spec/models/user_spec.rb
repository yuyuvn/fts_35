require "rails_helper"

describe User do
  subject {FactoryGirl.create :user}
  it {is_expected.to be_valid}

  describe "#exams" do
    before {subject.exams << FactoryGirl.create(:exam, user: subject)}
    it {expect{subject.destroy}.to change{Exam.count}.by -1}
  end

  describe "#name" do
    before {subject.name = nil}
    it {is_expected.to have_exactly(1).errors_on :name}
  end

  describe "#email" do
    context "when email is not presenced" do
      before {subject.email = nil}
      it {is_expected.to have_exactly(1).errors_on :email}
    end

    context "email is not formatted" do
      before {subject.email = "invalid_email"}
      it {is_expected.to have_exactly(1).errors_on :email}
    end
  end
end
