class Admin::QuestionsController < ApplicationController
  before_action :set_category, only: [:new, :create]

  def new
    @question = @category.questions.build
    Settings.question.minimum_answers.times{@question.answers.build}
  end

  def create
    @question = @category.questions.new question_params
    if @question.save
      redirect_to admin_category_url @category, success: t(".question_created")
    else
      render :new
    end
  end

  private
  def set_category
    @category = Category.find params[:category_id]
  end

  def question_params
    params.require(:question).permit :content, answers_attributes: [:id, :content, :is_correct, :_destroy]
  end
end
