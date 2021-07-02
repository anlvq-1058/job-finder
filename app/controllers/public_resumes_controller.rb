class PublicResumesController < ApplicationController
  before_action :authenticate_user!, :check_candidate_permit, only: :update

  def update
    @resume = Resume.find_by id: params[:id]
    resumes = current_user.resumes
    @other_resume = resumes.reject{|resume| resume.eql?(@resume)}
    @error = "not found object" if resumes.exclude?(@resume) || @resume.blank?
    @resume.public_status! if @error.blank?
    @other_resume.first.private_status! if @error.blank? && @other_resume.first.present?
    respond_to do |format|
      format.js
    end
  end
end
