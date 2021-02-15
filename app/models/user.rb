class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {minimum:1, maximum:50}
  validate :avatar_size

  private

  def avatar_size
    return if avatar.size < 5000000
    
    errors.add(:avatar, "file size must be lower than 5MB")
  end

end
