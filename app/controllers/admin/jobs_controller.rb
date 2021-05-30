class Admin::JobsController < Admin::AdminController
  before_action :load_job, only: %i(edit update destroy)
  before_action :search_attributes, only: %i(index)
  before_action :authenticate_user!

  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result.includes(company: :user)
                     .references(:company)
                     .where('users.id = ?', current_user.id)
                     .order(created_at: :desc)
                     .page(params[:page]).per 12
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
    @job = Job.find_by id: params[:id]
    return if @job.present?

    flash[:danger] = "Job not found"
    redirect_to admin_root_path
  end

  def search_attributes
    exp = params.dig(:q, :experience)
    case exp
    when "1"
      params[:q].merge!(experience_lt: 1)
    when "2"
      params[:q].merge!(experience_gteq: 1, experience_lteq: 3)
    when "3"
      params[:q].merge!(experience_gt: 3)
    end

    salary = params.dig(:q, :salary)
    case salary
    when "1"
      params[:q].merge!(salary_gteq: 100, salary_lteq: 500)
    when "2"
      params[:q].merge!(salary_gteq: 500, salary_lteq: 1000)
    when "3"
      params[:q].merge!(salary_gteq: 1000, salary_lteq: 3000)
    when "4"
      params[:q].merge!(salary_gteq: 3000, salary_lteq: 5000)
    when "5"
      params[:q].merge!(salary_gteq: 5000, salary_lteq: 10000)
    when "6"
      params[:q].merge!(salary_gt: 10000)
    end

    if params.dig(:jobs_are_recruiting, :end_at) == "1"
      params[:q].merge!(end_at_gteq: Date.today)
    end
  end
end
