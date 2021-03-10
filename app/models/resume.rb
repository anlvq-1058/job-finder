class Resume < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  RESUME_PERMIT = [:title, :email, :address, :phone_number, :avatar,
                   :position, :website, 
                   add_ons_attributes: [:title, :time, :content, :_destroy],
                   resume_skills_attributes: [:skill_id, :_destroy]].freeze

  belongs_to :user
  has_many :add_ons, dependent: :destroy
  has_many :resume_skills, dependent: :destroy

  accepts_nested_attributes_for :add_ons, :resume_skills, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: {minimum:1, maximum:50}
  validates :email, presence: true, length: {minimum:1, maximum:100}
  validates :address, presence: true, length: {minimum:1, maximum:100}
  validates :phone_number, presence: true, length: {minimum:1, maximum:10}

  enum status: {public: 0, private: 1}, _suffix: true
end
