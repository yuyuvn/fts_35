class Exam < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :questions, through: :results
  belongs_to :user
  belongs_to :category

  scope :old_exam, ->{where(started: false)
    .where "created_at <= ?", Settings.exams.time_limit.weeks.ago}

  accepts_nested_attributes_for :results

  before_create ->{self.questions = category.questions.some}
  before_save ->{self.correct_number = results.select{|result|
    result.is_correct?}.count}

  after_create ->{ExamWorker.perform_in Settings.delay_time.hours, self.id}

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
    announce_finished
  end

  def announce_finished
    ExamMailer.finished_announce(self).deliver
  end
end
