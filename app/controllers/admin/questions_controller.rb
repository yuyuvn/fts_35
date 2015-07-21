class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource :category
  load_and_authorize_resource through: :category

  def new
    Settings.question.minimum_answers.times{@question.answers.build}
  end

  def show
    @answers = @question.answers
  end

  def create
    if @question.save
      redirect_to admin_category_url @category,
        success: t("messages.admin.questions.created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update_attributes question_params
      redirect_to admin_category_question_url,
        success: t("messages.admin.questions.updated")
    else
      render :edit
    end
  end

  def destroy
    flash = if @question.destroy
      {success: t("messages.admin.questions.deleted")}
    else
      {success: t("messages.admin.questions.not_deleted")}
    end
    redirect_to admin_category_url @category, flash
  end

  private
  def question_params
    params.require(:question).permit :content,
      answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
