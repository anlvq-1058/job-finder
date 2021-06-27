class StaticPagesController < ApplicationController
  def home
    @jobs = Job.unexpired.active_status
    @job_full_time = @jobs.full_time
    @job_part_time = @jobs.part_time

    @count_jobs = paginate @jobs
    @count_job_full_time = paginate @job_full_time
    @count_job_part_time = paginate @job_part_time
    @lated_job = @jobs.job_in_week
    company_id_hash = @jobs.job_create_in_month.group(:company_id).count.sort_by{|_key, value| value}.reverse.to_h
    @company_top_hiring = Hash.new
    company_id_hash.each do |company_id, value|
      @company_top_hiring[Company.find(company_id)] = value
    end
  end

  def contact; end
end
