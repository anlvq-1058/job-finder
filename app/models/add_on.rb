class AddOn < ApplicationRecord
  belongs_to :resume

  validates :title, length: {maximum: 100}
  validates :time, lenth: {maximum: 100}
  validates :content, length: {maximum: 250}
end
