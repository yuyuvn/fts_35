class Admin::BaseController < ApplicationController
  before_filter :verify_admin

  private
  def verify_admin
    redirect_to root_url, alert: t("access_denied") unless current_user.try(:is_admin?)
  end
end
