class CompaniesController < ApplicationController
  def show
    @company = Company.find params[:id]
    @related_jobs = @company.jobs.unexpired.active_status
    @count_jobs = paginate @related_jobs
  end
end
