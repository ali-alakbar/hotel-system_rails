class Employee < ApplicationRecord
  belongs_to :hotel
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :joining_date, presence: true
  validates :birthday, presence: true
  validates :age, presence: true , numericality:   { only_integer: true, greater_than: 20 }
  validates :salary, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
