class Admin::JobsController < Admin::AdminController

  def index
    @jobs = current_user.company.jobs
  end

  def new
    @job = current_user.company.jobs.build
    @job.job_locations.build
  end

  def create
    @job = current_user.company.jobs.build job_params
    if @job.save
      flash[:success] = "Create success"
      redirect_to admin_jobs_path
    else
      flash[:danger] = "Create false"
      render new_admin_job_path
    end
  end

  def edit; end

  def update
    if @job.update job_params
      flash[:success] = "Update success"
      redirect_to admin_jobs_path
    else
      flash[:danger] = "Update false"
      render admin_job_path(@job)
    end
  end
  
  def destroy
    if @job.destroy
      flash[:success] = t "destroy success"
      redirect_to admin_jobs_path
    else
      flash.now[:danger] = t "destroy fail"
      redirect_to admin_jobs_path
    end    
  end

  private

  def job_params
    params.require(:job).permit Job::JOB_PARAMS      
  end
  
  def load_job
    @job = Job.find_by id: params(:id)
    return if @job.present?

    flash[:danger] = "Job not found"
    redirect_to admin_root_path
  end
end
