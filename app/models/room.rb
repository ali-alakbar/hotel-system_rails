
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


class Room < ApplicationRecord
  belongs_to :hotel
  validates :room_no, presence: true, uniqueness: true
  validates :floor_no, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 3 }
  validates :max_capacity, presence: true, numericality: { only_integer: true, smaller_than: 7 }
end
