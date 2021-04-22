class StaticPagesController < ApplicationController
  def home
    @jobs = Job.all
    @job_full_time = Job.where(job_type: "full_time")
    @job_part_time = Job.where(job_type: "part_time")

    @count_jobs = @jobs.size%10 != 0 ? (@jobs.size/10 + 1) : @jobs.size/10
    @count_job_full_time = @job_full_time.size%10 != 0 ? (@job_full_time.size/10 + 1) : @job_full_time.size/10
    @count_job_part_time = @job_part_time.size%10 != 0 ? (@job_part_time.size/10 + 1) : @job_part_time.size/10
  end

  def contact; end
end
