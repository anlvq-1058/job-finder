class Job < ApplicationRecord
  JOB_PARAMS = %i(title describe salary address
                  status end_at experience gender job_type).freeze

  validates :title, presence: true, length: {minimum: 1, maximum: 100}
  validates :describe, presence: true, length: {minimum: 1, maximum: 500}
  validates :salary, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000} 
  validates :address, presence: true, length: {minimum: 1, maximum: 200}
  validates :gender, presence: true

  has_one :location, through: :job_locations
  belongs_to :company
  has_rich_text :describe

  enum gender: {all: 0, male: 1, female: 2}, _suffix: true
  enum job_type: {full_time: 0, part_time: 1}
end
