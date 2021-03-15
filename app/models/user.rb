class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :lockable,
         :omniauthable , omniauth_providers: [:facebook, :google_oauth2]

  validates :name, presence: true, length: {minimum:1, maximum:50}
  validate :avatar_size

  has_many :resumes, dependent: :destroy
  
  enum role: {candidate: 0, recruiter: 1}
  enum status: {active: 0, inactive: 1}, _suffix: true
  enum gender: {male: 0, female: 1}

  def self.from_omniauth(auth)
    result = User.where(email: auth.info.email).first
    if result
      return result
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.image = auth.info.image
        user.uid = auth.uid
        user.provider = auth.provider
        user.birthday = "2000-01-1"
        #  If you are using confirmable and the provider(s) you use validate emails
        user.skip_confirmation!
      end
    end
  end

  private

  def avatar_size
    return if avatar.size < 5000000
    
    errors.add(:avatar, "file size must be lower than 5MB")
  end
end
