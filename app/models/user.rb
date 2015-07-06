class User < ActiveRecord::Base
  has_many :exams, dependent: :destroy
  
  FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    format: {with: FORMAT},
    presence: true, length: {maximum: Settings.user.email.maximum_length},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true
end
