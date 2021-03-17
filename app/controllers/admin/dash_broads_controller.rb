class Admin::DashBroadsController < Admin::AdminController
  def index
    @check_company_create = current_user.company
  end
end
