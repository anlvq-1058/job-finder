class JobsController < ApplicationController
  before_action :load_job, only: :show

  def show
  @related_jobs = Job.unexpired.where(company_id: @job.company.id).where.not(id: @job.id).limit(5)
  @count_jobs = paginate @related_jobs
  end

  private

  def load_job
    @job = Job.find_by id: params[:id]
    return if @job.present?

    flash[:danger] = "Job not found"
    redirect_to admin_root_path
  end
end
