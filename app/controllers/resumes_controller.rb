class ResumesController < ApplicationController
  before_action :load_resume, except: %i(index new create)
  def index
    @resumes = current_user.resumes
  end

  def new
    @resumes = current_user.resumes.build.tap do |r|
      r.add_ons.build
    end
  end

  def create
    @resume = current_user.resumes.build resume_params
    if @resume.save
      flash[:success] = t "notification.create_success"
      redirect_to root_url
    else
      flash.now[:danger] = t "notification.create_fail"
      render :new
    end
  end

  def show; end

  def update
    
  end

  def destroy
    
  end

  private

  def resume_params
    params.require(:resume).permit(Resume::RESUME_PERMIT)
  end

  def load_resume
    resume = Resume.find_by id: params[:id]
  end
end
