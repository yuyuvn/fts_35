class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.page params[:page]
  end
end
