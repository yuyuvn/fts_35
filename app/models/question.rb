class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :exams, through: :results
  belongs_to :category

  scope :some, ->{order("RAND()").limit 30}

  accepts_nested_attributes_for :answers,
    reject_if: ->attributes{attributes["content"].blank?},
    allow_destroy: true

  validates :content, presence: true
  validates :answers, length: {minimum: 4}
  validate :correct_answer_number

  private
  def correct_answer_number
    errors.add :base,
      I18n.t("activerecord.errors.messages.wrong_correct_answer_number") unless
        answers.reject(&:marked_for_destruction?).select(&:correct?).count == 1
  end
end
