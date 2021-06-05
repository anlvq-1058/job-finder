class UserApplyMailer < ApplicationMailer
  def approved apply_resume
    @user_apply = apply_resume.resume.user
    mail to: @user_apply.email, subject: "PASS REVIEW RESUME"
  end

  def cancel apply_resume
    @user_apply = apply_resume.resume.user
    mail to: @user_apply.email, subject: "FAIL REVIEW RESUME"
  end
end
