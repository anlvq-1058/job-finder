class StaticPagesController < ApplicationController
  def home
    @jobs = Job.unexpired
    @job_full_time = Job.unexpired.full_time
    @job_part_time = Job.unexpired.part_time

    @count_jobs = paginate @jobs
    @count_job_full_time = paginate @job_full_time
    @count_job_part_time = paginate @job_part_time
    @lated_job = Job.unexpired.job_in_week
  end

  def contact; end
end
