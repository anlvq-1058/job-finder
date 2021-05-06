class InactiveUsersController < ActionController::Base
  before_action :authenticate_user!

  def update
    current_user.inactive_status!
    respond_to do |format|
      format.js
    end
  end
end
