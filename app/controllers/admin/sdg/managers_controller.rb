class Admin::SDG::ManagersController < Admin::BaseController
  load_and_authorize_resource instance_name: :sdg_manager, class: "SDG::Manager"

  def index
    @sdg_managers = @sdg_managers.page(params[:page])
  end

  def search
    @users = User.search(params[:name_or_email])
                 .includes(:sdg_manager)
                 .page(params[:page])
                 .for_render
  end

  def create
    @sdg_manager.user_id = params[:user_id]
    @sdg_manager.save!

    redirect_to admin_sdg_managers_path
  end

  def destroy
    @sdg_manager.destroy!
    redirect_to admin_sdg_managers_path
  end
end
