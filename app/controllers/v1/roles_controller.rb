class V1::RolesController < ApplicationController
  
  before_action :find_role_id, only: %i[show destroy]   
  
  def index
    @q = Role.ransack(params[:q])
    @roles = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show
  end
  
  def new
    @role = Role.new
  end


  def create
    @role = Role.create(roles_params)
    if @role.save
      redirect_to v1_roles_path
    else
      render 'new'
    end
  end

  def destroy
    @role.destroy
    redirect_to v1_roles_path
  end


  private

  def find_role_id
    @role = Role.find(params[:id])
  end

  def roles_params
    params.require(:role).permit(:name_en, :name_ar, :hotel_id)
  end

end

