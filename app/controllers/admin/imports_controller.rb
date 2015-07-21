class Admin::ImportsController < ApplicationController
  def create
    User.import params[:file]
    redirect_to admin_users_url, success: t("messages.admin.imports.success")
  end
end
