class Employee < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :joining_date, presence: true
  validates :birthday, presence: true
  validates :salary, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
