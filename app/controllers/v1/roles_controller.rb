# frozen_string_literal: true

module V1
  class RolesController < ApplicationController
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
      if find_role.present?
        render_success(message: :data_found, data: find_role)
      else
        render_not_found(message: 'Role not found')
      end
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
      if find_role.destroy
        render_success(message: :data_removed)
      else
        render_unprocessable_entity(message: 'Data could not be deleted')
      end
    end

    private

    def find_role
        @find_role ||= Role.find_by(params[:id])
      rescue ActiveRecord::RecordNotFound
        @find_role = nil
    end

    def roles_params
      params.require(:role).permit(:name_en, :name_ar, :hotel_id)
    end
  end
end