require "csv"
class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource param_method: :user_params
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.page params[:page]
    respond_to do |format|
      format.html
      format.csv do
        @headers = Settings.user.csv.fields.map do |field|
          @users.human_attribute_name field
        end
        headers["Content-Disposition"] =
          %(attachment; filename="#{Settings.user.csv.filename}")
        headers["Content-Type"] = Settings.user.csv.type
      end
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to @user, success: t("messages.user.updated")
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, success: t("messages.user.deleted")
  end

  private
  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit :name, :email
  end
end
