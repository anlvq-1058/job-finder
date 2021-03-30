class Admin::AdminController < ApplicationController
  before_action :admin_required

  private

  def admin_required
    return if current_user.recruiter?

    flash[:danger] = "You don't have permit"
    redirect_to root_path
  end
end
