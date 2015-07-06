class Category < ActiveRecord::Base
  has_many :exams, dependent: :destroy
  has_many :questions, dependent: :destroy
  
  validates :name, :max_time, presence: true
  validates :max_time, numericality: {only_integer: true,
    greater_than: Settings.category.max_time.minimum}
end
