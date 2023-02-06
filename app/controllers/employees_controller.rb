
class EmployeesController < ApplicationController
  before_action :find_resource, only: %i[show edit destroy]
  def index
      @employee = Employee.all
  end

   def show
      @employee = Employee.find(params[:id])
  end

  def edit
      @employee = Employee.find(params[:id])
  end

  def update
      @employee = Employee.find(params[:id])
      if @employee.update(employees_params)
          redirect_to employees_path
      else
          render 'new'
      end
  end


  def new
      @employee = Employee.new

  end


  def create
      @employee = Employee.new(employees_params)
      if @employee.save
          redirect_to employees_path, notice:  "Employee is saved successfully."
      else
          render 'new'
      end
      flash[:notice]

  end


 def destroy
      @employee = Employee.find(params[:id])
      @employee.destroy
      redirect_to employees_path
  end


  private
  
  def employees_params
      params.require(:employee).permit(:first_name, :last_name, :email, :joining_date, :birthday, :salary, :hotel_name, :hotel_id, :age)
  end
end