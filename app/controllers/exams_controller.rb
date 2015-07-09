class ExamsController < ApplicationController
  load_and_authorize_resource

  def show
    redirect_to [:edit, @exam] unless @exam.started?
  end

  def new
    @categories = Category.all
  end

  def create
    if @exam.save
      redirect_to root_url , success: t("messages.exams.created")
    else
      render :new
    end
  end

  def edit
    if @exam.started?
      redirect_to @exam
      @exam.start
    end
  end

  def update
    if @exam.finished?
      redirect_to @exam
    elsif @exam.update_attributes(exam_params)
      @exam.finish
      redirect_to @exam, success: t("messages.exams.finished")
    else
      render :edit
    end
  end

  private
  def exam_params
    params.require(:exam).permit results_attributes: [:id, :answer_id]
  end

  def create_params
    params.require(:exam).merge(user_id: current_user.id)
      .permit [:user_id, :category_id]
  end
end
