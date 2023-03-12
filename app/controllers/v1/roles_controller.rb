class V1::RolesController < ApplicationController
  
  before_action :find_role, only: %i[show destroy]   
  
  def index
    roles = Role.all 
    if roles.present?
      render_success(message: :data_found, data: roles)
    else
      render_empty(root: :roles, message: :no_roles_found)
    end
  end

  def show
    render_success(message: :data_found, data: find_role)
  end
  
  def create
    role = Role.create(roles_params)
    if role.save
      render_created(message: :data_created, data: role)
    else
      render_unprocessable_entity(message: role.errors.full_messages.join(', '))
    end
  end

  def destroy
    role = find_role
    if role.destroy
      render_success(message: :data_removed)
    else
      render_unprocessable_entity(message: 'Data could not be deleted')
    end
  end


  private

  def find_role
    role ||= Role.find_by(id: params[:id])
  end

  def roles_params
    params.require(:role).permit(:name_en, :name_ar, :hotel_id)
  end

end

