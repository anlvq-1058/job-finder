class ActiveUsersController < ActionController::Base
  def update
    current_user.active_status!
    respond_to do |format|
      format.js
    end
  end
end
