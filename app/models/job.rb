class Job < ApplicationRecord
  JOB_PARAMS = [:title, :describe, :salary, :address,
                :status, :end_at, :experience, :gender, :job_type, location_ids: []].freeze

  validates :title, presence: true, length: {minimum: 1, maximum: 100}
  validates :describe, presence: true, length: {minimum: 1, maximum: 500}
  validates :salary, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000}
  validates :address, presence: true, length: {minimum: 1, maximum: 200}
  validates :gender, presence: true
  validates :job_locations, presence: :true
  validates :experience, presence: :true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20}
  validates :end_at, presence: true
  validates :location_ids, presence: :true

  has_many :job_locations
  has_many :locations, through: :job_locations
  belongs_to :company
  has_rich_text :describe

  enum gender: {all: 0, male: 1, female: 2}, _suffix: true
  enum job_type: {full_time: 0, part_time: 1}
end
