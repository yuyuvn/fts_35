class Exam < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :questions, through: :results
  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :results

  before_create ->{self.questions = category.questions.some}
  before_save ->{self.correct_number = results.select{|result|
    result.is_correct?}.count}

  def start
    update_attributes started: true, started_at: Time.zone.now
  end

  def time_left
    if finished?
      0
    elsif started?
      started_at - category.max_time.minutes.ago
    else
      category.max_time.minutes
    end
  end

  def finish
    update_attributes finished: true
  end
end
