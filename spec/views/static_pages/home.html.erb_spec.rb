require "rails_helper"

describe "static_pages/home.html.erb" do
  it do
    render
    expect(rendered).to have_link "Sign up now!", href: new_user_registration_path
  end
end
