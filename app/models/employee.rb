class Employee < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :joining_date, presence: true
  validates :salary, presence: true, numericality: { only_float: true, greater_than: 0 }
  validate :valid_birthday
  

  private

  def valid_birthday
    if birthday.present? && (birthday < Date.new(1940,1,1) || birthday >= Date.new(2020,1,1))
      errors.add(:birthday, "Date is not valid, please try again.")
    end
  end

end
