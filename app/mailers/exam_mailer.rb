class ExamMailer < ApplicationMailer
  include Sidekiq::Mailer

  def remind_user exam
    @exam = exam
    mail to: @exam.user.email
  end

  def finished_announce exam
    @exam = exam
    mail to: @exam.user.email
  end
end
