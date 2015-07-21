class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.page params[:page]
  end

  def show
    @questions = @category.questions
  end

  def new
  end

  def create
    if @category.save
      redirect_to admin_categories_url,
        success: t("messages.admin.categories.created")
    else
      reder :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      redirect_to admin_category_url,
        success: t("messages.admin.categories.updated")
    else
      render :edit
    end
  end

  def destroy
    flash = if @category.destroy
      {success: t("messages.admin.categories.deleted")}
    else
      {danger: t("messages.admin.categories.not_deleted")}
    end
    redirect_to admin_categories_url, flash
  end

  private
  def category_params
    params.require(:category).permit :name, :max_time
  end
end
