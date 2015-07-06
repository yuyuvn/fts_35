class Answer < ActiveRecord::Base
  has_many :results, dependent: :destroy
  belongs_to :question
  
  validates :content, presence: true
  validates_uniqueness_of :content, scope: :question
end
