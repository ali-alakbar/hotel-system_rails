class V1::RolesController < ApplicationController
  
  before_action :find_role, only: %i[show destroy]   
  
  def index
    @roles = Role.all 
    if @roles.present?
      render_success(message: "Data found", data: @roles)
    else
      render_empty(root: 'roles', message: 'No roles found')
    end
  end

  def show
    render_success(message: "Data found", data: @role)
  end
  
  def create
    @role = Role.create(roles_params)
    if @role.save
      render_created(message: "Data created", data: @role)
    else
      render_unprocessable_entity(message: @role.errors.full_messages.join(', '))
    end
  end

  def destroy
    if @role.destroy
      render_success(message: 'Data deleted')
    else
      render_unprocessable_entity(message: 'Data could not be deleted')
    end
  end


  private

  def find_role
    @role ||= Role.find(params[:id])
  end

  def roles_params
    params.require(:role).permit(:name_en, :name_ar, :hotel_id)
  end

end

