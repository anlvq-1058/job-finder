module ApplicationHelper
  def full_title title
    base_title = "Find Job 2"
    title.blank? ? base_title : [title, base_title].join(" | ")
  end

  def check_page title
    title == "Home" ? true : false
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'danger'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def show_avatar avatar_size
    image_tag current_user.avatar.url || "content/default-avatar.png",
    class: "avatar ava-#{avatar_size}"
  end

  def resume_avatar resume, size
    image_tag resume.avatar.url || "content/default-avatar.png",
    {class: "resume-avatar #{size}"}
  end

  def show_company_avatar job, avatar_size
    image_tag job.company.avatar.url || "content/default-avatar.png",
    class: "avatar ava-#{avatar_size}"
  end

  def show_company_avatar_img  company, avatar_size
    image_tag company.avatar.url || "content/default-avatar.png",
    class: "avatar ava-#{avatar_size}"
  end

  def years_exp job
    job.experience.blank? || job.experience.zero? ? "" : "#{job.experience} Yrs Exp."
  end

  def page_index params_page, index, per_page
    params_page ||= 1
    (params_page.to_i - 1) * per_page.to_i + index.to_i + 1
  end

  def find_resume resume_id
    Resume.with_deleted.find resume_id
  end
end
