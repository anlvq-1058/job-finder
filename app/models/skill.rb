class Skill < ApplicationRecord
  has_many :resume_skills, dependent: :destroy
end
