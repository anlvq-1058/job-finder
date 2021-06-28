class InactiveUsersController < ApplicationController
  before_action :authenticate_user!, :check_candidate_permit, only: :update

  def update
    current_user.inactive_status!
    respond_to do |format|
      format.js
    end
  end
end
