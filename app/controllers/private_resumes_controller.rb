class PrivateResumesController < ActionController::Base
  before_action :authenticate_user!

  def update
    @resume = Resume.find_by(id: params[:id])
    resumes = current_user.resumes
    @other_resume = resumes.reject{|resume| resume.eql?(@resume)}
    @error = "not found object" if resumes.exclude?(@resume) || @resume.blank?
    @resume.private_status! if @error.blank?
    @other_resume.first.public_status! if @error.blank? && @other_resume.first.present?
    respond_to do |format|
      format.js
    end
  end
end
