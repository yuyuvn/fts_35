class Answer < ActiveRecord::Base
  has_many :results, dependent: :destroy
  belongs_to :question

  validates :content, presence: true,
    uniqueness: {case_sensitive: false, scope: :question}
end
