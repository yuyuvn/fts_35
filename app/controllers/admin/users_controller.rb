require "csv"
class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html do
        @search = @users.search params[:q]
        @users = @search.result.page params[:page]
      end
      format.csv do
        send_data render_to_string, type: Settings.user.csv.type,
          filename: Settings.user.csv.filename
      end
    end
  end

  def new
  end

  def create
    if @user.save
      redirect_to @user, success: t("messages.user.created")
    else
      render :new
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
  def user_params
    params.require(:user).permit :name, :email
  end

  def create_params
    user_params.merge password:
     Devise.friendly_token.first(Settings.user.password_length)
  end
end
