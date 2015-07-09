class FinishExamWorker
  include Sidekiq::Worker

  def perform exam_id
    exam = Exam.find exam_id
    exam.finish unless exam.finished?
  end
end
