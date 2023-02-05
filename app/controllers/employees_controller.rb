
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

    end


    def create
        @employee = Employee.new(employees_params)
        if @employee.save
            redirect_to employees_path, notice:  "Employee is saved successfully."
        else
            puts "==========="
            puts @employee.errors.full_messages
            puts "==========="
            render 'new'
        end
        flash[:notice]

    end


    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path
    else
      render 'new'
    end
  end


    private
    def employees_params
        params.require(:employee).permit(:first_name, :last_name, :email, :joining_date, :birthday, :salary, :hotel_name, :hotel_id, :age)
    end
end