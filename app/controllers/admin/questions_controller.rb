class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_category
  def new
    @question = @category.questions.build
    Settings.question.minimum_answers.times{@question.answers.build}
  end

  def show
    @answers = @question.answers
  end

  def create
    @question = @category.questions.new question_params
    if @question.save
      redirect_to admin_category_url @category, success: t(".question_created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update_attributes question_params
      redirect_to admin_category_question_url, success: t(".flash_editted_question")
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to admin_category_url @category, success: t(".flash_deleted")
    else
      redirect_to admin_category_url @category, success: t(".flash_not_delete")
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
