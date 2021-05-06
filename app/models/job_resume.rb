class JobResume < ApplicationRecord
  belongs_to :job
  belongs_to :resume
end
