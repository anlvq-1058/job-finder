class ResumeSkill < ApplicationRecord
  acts_as_paranoid

  belongs_to :resume, inverse_of: :resume_skills
  belongs_to :skill

  accepts_nested_attributes_for :resume

  validates_numericality_of :point, greater_than: 1, less_than_or_equal_to: 100
end
