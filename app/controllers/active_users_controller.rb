class ActiveUsersController < ActionController::Base
  before_action :authenticate_user!

  def update
    current_user.active_status!
    respond_to do |format|
      format.js
    end
  end
end
