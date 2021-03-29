class Company < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  COMPANY_PERMIT = %i(name website description 
                      founded address avatar).freeze
  belongs_to :user
  has_many :jobs

  validates :name, presence: true, length: {minimum: 1, maximum: 100}
  validates :website, length: {minimum: 1, maximum: 100}
  validates :description, length: {minimum: 1, maximum: 500}
  validates :address, presence: true, length: {minimum: 1, maximum: 100}
  validate :avatar_size  

  private

  def avatar_size
    return if avatar.size < 5000000
    
    errors.add(:avatar, "file size must be lower than 5MB")
  end
end
