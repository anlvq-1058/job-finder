class Admin::CompaniesController < Admin::AdminController
  before_action :load_company, except: %i(new create)

  def new
    @company = current_user.build_company
  end

  def create
    binding.pry
    @company = current_user.build_company company_params
    if @company.save
      flash[:success] = "Create company success"
      redirect_to admin_root_path
    else
      flash[:danger] = "Create company false"
      redirect_to admin_root_path
    end
  end

  def edit; end

  def update
    if Company.update company_params
      flash[:success] = "Update company success"
      redirect_to admin_root_path
    else
      flash[:danger] = "Update company false"
      redirect_to admin_root_path
    end
  end

  private

  def company_params
    params.require(:company).permit(Company::COMPANY_PERMIT)
  end

  def load_company
    @company = Company.find_by id: params[:id]
    return if @company

    flash[:danger] = "Not found object"
    redirect_to admin_root_path
  end
end
