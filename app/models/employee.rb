# frozen_string_literal: true

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
  # ======================== MODULES INCLUSION ====================== #
  extend Enumerize

  # ======================== CONSTANTS ============================== #
  # ======================== SCOPES ================================= #
  # ======================== ENUMS ================================== #
  enumerize :status, in: { pending: 1 , active: 2, inactive: 3 }

  # ======================== ASSOCIATIONS =========================== #
  belongs_to :hotel
  belongs_to :role

  # ======================== VALIDATIONS ============================ #
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :joining_date, presence: true
  validates :salary, presence: true, numericality: { only_float: true, greater_than: 0 }
  validate :valid_age, :valid_birthday
  
  # ======================== CALLBACKS ============================== #
  after_create :send_welcome_email
  
  # ======================== OTHERS ================================= #
  
  private  

  # ======================== CLASS METHODS ========================== #
  # ======================== INSTANCE METHODS ======================= #
  def role_name
    '#{role.name_en} (#{role.name_ar})'
  end

  def send_welcome_email
    EmployeeMailer.send_notofication_email(self).deliver_now
  end

  def valid_age
    if age.present? && (age <= 20 )
      errors.add(:age, 'Age must be greater than 20')
    end 
  end

  def valid_birthday
    if birthday.present? && (birthday < Date.new(1940, 1, 1) || birthday >= Date.new(2020, 1, 1))
      errors.add(:birthday, 'Date is not valid, please try again.')
    end
  end

end