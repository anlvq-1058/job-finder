class Company < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  COMPANY_PERMIT = %i(name website description 
                      founded description address avatar).freeze
  belongs_to :user
end
