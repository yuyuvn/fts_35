class Exam < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :questions, through: :results
  belongs_to :user
  belongs_to :category

  scope :old_exam, lambda {
    where(started: false).where "created_at <= ?", 1.weeks.ago
  }

  accepts_nested_attributes_for :results

  before_create ->{self.questions = category.questions.some}
  before_save ->{self.correct_number = results.select(&:correct?).count}

  after_create ->{RemineUserWorker.perform_in 2.hours, id}

  def start
    update_attributes started: true, started_at: Time.zone.now
    FinishExamWorker.perform_in category.max_time.minutes, id
  end

  def time_left
    if started?
      finished? ? 0 : started_at - category.max_time.minutes.ago
    else
      category.max_time.minutes
    end
  end

  def finish
    update_attributes finished: true
    announce_finished
  end

  def announce_finished
    ExamMailer.delay.finished_announce self
  end
end
