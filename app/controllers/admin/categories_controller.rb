class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.page params[:page]
  end

  def show
  end

  def new
  end

  def create
    if @category.save
      redirect_to admin_categories_url, success: t(".flash_add")
    else
      reder :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      redirect_to admin_category_url, success: t(".flash_editted")
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_url, success: t("flash_deleted")
    else
      redirect_to admin_categories_url, danger: t("flash_not_delete")
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :max_time
  end
end
