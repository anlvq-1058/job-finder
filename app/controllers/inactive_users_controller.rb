class InactiveUsersController < ActionController::Base
  def update
    current_user.inactive_status!
    respond_to do |format|
      format.js
    end
  end
end
