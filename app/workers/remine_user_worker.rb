class RemineUserWorker
  include Sidekiq::Worker

  def perform exam_id
    exam = Exam.find exam_id
    ExamMailer.remind_user(exam).deliver! unless exam.started?
  end
end
