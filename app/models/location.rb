class Location < ApplicationRecord
  has_many :job_locations
  has_many :jos, through: :job_locations
end
