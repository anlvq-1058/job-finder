class Job < ApplicationRecord
  JOB_PARAMS = [:title, :describe, :salary, :address,
                :status, :end_at, :experience, :gender, :job_type, location_ids: []].freeze

  has_many :job_locations
  has_many :locations, through: :job_locations
  belongs_to :company
  has_many :job_resumes
  has_many :resumes, through: :job_resumes

  validates :title, presence: true, length: {minimum: 1, maximum: 100}
  validates :describe, presence: true, length: {minimum: 1, maximum: 10000}
  validates :salary, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000}
  validates :address, presence: true, length: {minimum: 1, maximum: 200}
  validates :gender, presence: true
  validates :job_locations, presence: :true
  validates :experience, presence: :true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20}
  validates :end_at, presence: true
  validates :location_ids, presence: :true
  validate :greater_than_now

  scope :job_in_week, -> {where("updated_at > ?", Date.current - 7)}
  scope :unexpired, -> {where("end_at > ?", Date.current)}

  enum gender: {all: 0, male: 1, female: 2}, _suffix: true
  enum job_type: {full_time: 0, part_time: 1}
  enum status: {active: 0, inactive: 1}, _suffix: true

  def greater_than_now
    errors.add(:end_at, "should greater than current time") unless end_at > Date.current
  end
end
