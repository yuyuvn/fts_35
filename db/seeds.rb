FactoryGirl.create :admin_user,
  name: Settings.default_admin.name,
  email: Settings.default_admin.email,
  password: Settings.default_admin.password
