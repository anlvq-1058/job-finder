module ApplicationHelper
  def full_title title
    base_title = "Find Job 2"
    title.blank? ? base_title : [title, base_title].join(" | ")
  end

  def check_page title
    title == "Home" ? true : false
  end
end
