class Admin::ResumesController < Admin::AdminController
  before_action :check_recruiter_view_resume, only: :show
  before_action :authenticate_user!
  
  def show
    @resume = Resume.with_deleted.find params[:id]
  end
end
