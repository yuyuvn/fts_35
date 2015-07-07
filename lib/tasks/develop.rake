require "factory_girl"
namespace :develop do
  desc "TODO"
  task create_data: :environment do
    FactoryGirl.create :category
  end
end
