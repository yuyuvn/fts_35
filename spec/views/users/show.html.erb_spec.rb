require "rails_helper"

describe "users/show.html.erb" do
  before do
    user = mock_model(User, name: "dev", email: "dev@gmail.com",
      password: "dev123455")
    assign :user, user
  end

  it do
    render
    expect(rendered).to match /Name: dev/
    expect(rendered).to match /Email: dev@gmail\.com/
  end
end
