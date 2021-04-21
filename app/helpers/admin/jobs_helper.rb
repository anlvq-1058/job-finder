module Admin::JobsHelper
  def checked_gender_job gender
    params.dig(:q, :gender_eq) == gender ? true : false
  end

  def checked_experience_job exp
    params.dig(:q, :experience) == exp ? true : false
  end

  def checked_salary_job salary
    params.dig(:q, :salary) == salary ? true : false
  end

  def checked_end_at_job val
    params.dig(:jobs_are_recruiting, :end_at) == val ? true : false
  end
end
