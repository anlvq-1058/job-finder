module Admin::StaticPagesHelper
  def checked_type_job job
    job&.job_type == "full_time" ? "Full Time" : "Part Time"
  end
end
