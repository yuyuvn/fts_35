FactoryGirl.define do
  factory :user do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    password "12345678"
    password_confirmation {|user| user.password}

    factory :admin_user do
      is_admin true
    end
  end
end
