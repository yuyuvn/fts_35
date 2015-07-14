class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :exams, dependent: :destroy

  validates :name, presence: true

  def is_guest?
    id.nil?
  end

  def self.import file
    CSV.foreach file.path, headers: true do |row|
      User.create row.to_hash.merge password: 
        Devise.friendly_token.first(Settings.user.password_length)
    end
  end
end
