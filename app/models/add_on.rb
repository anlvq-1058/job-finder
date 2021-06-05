class AddOn < ApplicationRecord
  acts_as_paranoid

  belongs_to :resume

  validates :title, length: {maximum: 100}
  validates :time, length: {maximum: 100}
  validates :content, length: {maximum: 1000}
end
