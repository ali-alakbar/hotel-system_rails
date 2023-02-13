
# == Schema Information
#
# Table name: employees
#
#  first_name         :string    
#  last_name          :string    
#  email              :string            
#  joining_date       :date      
#  birthday           :date      
#  birthday           :date      
#  age                :integer      
#  salary             :float      
#  hotel_id           :integer      

# ==================


class Employee < ApplicationRecord
  belongs_to :hotel
  validates :first_name, :last_name, :joining_date, :birthday, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :age, presence: true , numericality:   { only_integer: true, greater_than: 20 }
  validates :salary, presence: true, numericality: { greater_than: 0 }
end
