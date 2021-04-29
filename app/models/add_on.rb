class AddOn < ApplicationRecord
  belongs_to :resume
  has_rich_text :content

  validates :title, length: {maximum: 100}
  validates :time, length: {maximum: 100}
  validates :content, length: {maximum: 1000}
end
