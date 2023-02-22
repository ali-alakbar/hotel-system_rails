
class EmployeesController < ApplicationController
  before_action :find_employee_id, only: %i[show destroy]   
    
  def index
    @employees = Employee.all
  end

  
  def show
    
  end


  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employees_params)
    if @employee.save
        redirect_to employees_path
    else
      render 'new'
    end
  end


  def destroy
    @employee.destroy
    redirect_to employees_path
  end


  private

  def find_employee_id
    @employee = Employee.find(params[:id])
  end

  def employees_params
    params.require(:employee).permit(:first_name, :last_name, :email, :joining_date, :birthday, :salary)
  end
end