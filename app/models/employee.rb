
# == Schema Information == 
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
#  status             :integer
# ==================


class Employee < ApplicationRecord
  
  extend Enumerize

  enumerize :status, in: { pending: 1 , active: 2, inactive: 3 }

  
  def self.ransackable_attributes(auth_object = nil)
    super & %w[email]
  end

  belongs_to :hotel

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :joining_date, presence: true
  validates :salary, presence: true, numericality: { only_float: true, greater_than: 0 }

  validate :valid_age
  validate :valid_birthday
  

  private

  def valid_age
    if age.present? && (age <= 20 )
      errors.add(:age, "Age must be greater than 20")
    end 
  end

  def valid_birthday
    if birthday.present? && (birthday < Date.new(1940,1,1) || birthday >= Date.new(2020,1,1))
      errors.add(:birthday, "Date is not valid, please try again.")
    end
  end

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
