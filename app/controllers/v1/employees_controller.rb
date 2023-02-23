
class V1::EmployeesController < ApplicationController
  before_action :find_employee_id, only: %i[show destroy]   
    
  def index
    @q = Employee.ransack(params[:q])
    @employees = @q.result(distinct: true).page(params[:page]).per(2)
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
        redirect_to v1_employees_path
    else
      render 'new'
    end
  end

  def destroy
    @employee.destroy
    redirect_to v1_employees_path
  end

  private
  
  def find_employee
    @employee = Employee.find(params[:id])
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
    params.require(:employee).permit(:first_name, :last_name, :email, :age, :joining_date, :birthday, :salary, :hotel_id)
  end
end