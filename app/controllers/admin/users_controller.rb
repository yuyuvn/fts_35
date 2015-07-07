class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource param_method: :user_params

  def index
    @users = User.page params[:page]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      redirect_to @user, success: t("messages.user.updated")
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_url, success: t("messages.user.deleted")
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
