class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :lockable,
         :omniauthable , omniauth_providers: [:facebook, :google_oauth2]

  validates :name, presence: true, length: {minimum:1, maximum:50}
  validates :email, presence: true, uniqueness: true,
            length: {maximum: 100}
  validate :avatar_size
  validate :password_complexity

  has_many :resumes, dependent: :destroy
  has_one :company
  
  enum role: {candidate: 0, recruiter: 1}
  enum status: {active: 0, inactive: 1}, _suffix: true
  enum gender: {male: 0, female: 1}

  before_save :downcase_email

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

  def downcase_email
    email.downcase
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,128}\z/

    errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
