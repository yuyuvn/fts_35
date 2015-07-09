class ExemWorker
  include Sidekiq::Worker

  def perform exam_id
    exam = Exam.find exam_id
    ExamMailer.remine_user(exam).deliver unless exam.started?
  end
end
