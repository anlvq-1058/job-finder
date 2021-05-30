class Resume < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  acts_as_paranoid

  RESUME_PERMIT = [:title, :email, :address, :phone_number, :avatar,
                   :position, :website, 
                   add_ons_attributes: [:title, :time, :content, :id, :_destroy],
                   resume_skills_attributes: [:skill_id, :point, :id, :_destroy]].freeze

  belongs_to :user

  validates :title, presence: true, length: {minimum:1, maximum:50}
  validates :email, presence: true, length: {minimum:1, maximum:100}
  validates :address, presence: true, length: {minimum:1, maximum:100}
  validates :phone_number, presence: true, length: {minimum:1, maximum:10}
  validate :avatar_size
  validates_associated :resume_skills

  has_many :add_ons, dependent: :destroy
  has_many :resume_skills, inverse_of: :resume, dependent: :destroy
  has_many :skills, through: :resume_skills
  has_many :job_resumes
  has_many :jobs, through: :job_resumes

  accepts_nested_attributes_for :add_ons, :resume_skills, reject_if: :all_blank, allow_destroy: true

  enum status: {private: 0, public: 1}, _suffix: true

  scope :by_ids, lambda { |ids| where( id: ids)}

  private

  def avatar_size
    return if avatar.size < 5000000
    
    errors.add(:avatar, "file size must be lower than 5MB")
  end
end
