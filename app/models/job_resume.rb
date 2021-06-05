class JobResume < ApplicationRecord
  belongs_to :job
  belongs_to :resume

  scope :get_job_ids, lambda { |resume_id| where(resume_id: resume_id)}
  enum status: {uncheck: 0, approve: 1, cancel: 2}, _suffix: true
end
