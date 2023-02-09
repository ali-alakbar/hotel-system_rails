
class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]  
  def index
    @employees = Employee.all
  end

  def show
  end

  def edit
  end

  def update
    if @employee.update(employees_params)
        redirect_to employees_path
    else
        render 'edit'
    end
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
  
  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employees_params
    params.require(:employee).permit(:first_name, :last_name, :email, :joining_date, :birthday, :salary, :hotel_name, :hotel_id, :age)
  end
end