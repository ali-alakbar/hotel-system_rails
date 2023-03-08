
class V1::EmployeesController < ApplicationController

  before_action :find_employee, only: [:show, :destroy]

  def index
    employees = Employee.all
    if employees.present?
      render_success(message: :data_found, data: employees)
    else
      render_empty(root: :employees, message: 'No employees found')
    end
  end
  
  def show
    render_success(message: :data_found, data: @employee)
  end


  def create
    @employee = Employee.new(employees_params)
    if @employee.save
      render_created(message: :data_created, data: @employee)
    else
      render_unprocessable_entity(message: @employee.errors.full_messages.join(', '))
    end
  end

  def destroy
    if @employee.destroy
      render_success(message: :data_removed)
    else
      render_unprocessable_entity(message: 'Data could not be deleted')
    end
  end

  private

  def find_employee
    @employee ||= Employee.find(params[:id])
  end

  def check_errors
    if response.status == 200
      puts "==========="
      Rails.logger.info("Request: #{request.method} - #{request.url}")
      Rails.logger.info("Response: #{response.status}")
      puts "==========="
    end
  end

  def employees_params
    params.require(:employee).permit(:first_name, :last_name, :email, :age, :joining_date, :birthday, :salary, :hotel_id, :status, :role_id)
  end
end