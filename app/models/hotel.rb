
# == Schema Information == 
#
# Table name: hotel
#
#  name            :string    
#  string          :string    
#  address         :string            
#  phone_number    :string

# ==================



class Hotel < ApplicationRecord

  has_many :rooms,       dependent:  :destroy
  has_many :employees,   dependent:  :destroy


  validates :name, :city, :address, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { in: 6...12 }


end
