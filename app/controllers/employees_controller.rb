
class EmployeesController < ApplicationController
    def index
        flash[:notice] 
        if Hotel.count == 0
            puts "You must create a hotel"
            redirect_to root_path, notice: "Please add a hotel first."
        else
            @employee = Employee.all
        end
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
        hotel = Hotel.find_by(hotel_id: @employee.employee_id)
        hotel_id = hotel.hotel_id.to_s.gsub(" ", "") if hotel.try(:hotel_id).present?
        employee_id = @employee.employee_id.gsub(" ", "")
        if hotel_id == employee_id
            @employee.hotel_id = hotel.id
            if @employee.save
                redirect_to employees_path, notice:  "Employee is saved successfully."
            else
                redirect_to employees_path, notice:  "You must create a hotel first."
            end
        else
        redirect_to employees_path, notice:  "The hotel ID is NOT exist, You must create a hotel first."
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
        params.require(:employee).permit(:first_name, :last_name, :email, :joining_date, :birthday ,:salary, :employee_id, :total)
    end
end