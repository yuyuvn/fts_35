class Admin::UsersController < Admin::BaseController
  def index
    @users = User.page params[:page]
  end
end
