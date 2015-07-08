class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :exams, through: :results
  belongs_to :category
  
  accepts_nested_attributes_for :answers,
    reject_if: ->attributes{attributes["content"].blank?},
    allow_destroy: true
  
  validates :content, presence: true
  validates :answers, length: {minimum: Settings.question.minimum_answers}
  validate :correct_answer_number
  
  private
  def correct_answer_number
    unless answers.reject(&:marked_for_destruction?)
      .select{|answer| answer.is_correct?}
      .length == Settings.question.correct_answer_number
      self.errors.add :base,
        I18n.t("activerecord.errors.messages.wrong_correct_answer_number")
    end
  end
end
