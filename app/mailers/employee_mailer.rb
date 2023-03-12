class EmployeeMailer < ApplicationMailer

  def send_notofication_email(employee)
    @employee = employee
    mail(to: "ali2akbar5@gmail.com", subject: "Employee notoficiation")
  end

end
