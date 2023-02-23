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
  
  def self.ransackable_attributes(auth_object = nil)
    super & %w[name]
  end
  
  acts_as_api

  api_accessible :details do |t|
    t.add :name
    t.add :city
    t.add :address
    t.add :phone_number
  end

  has_many :rooms,       dependent:  :destroy
  has_many :employees,   dependent:  :destroy


  validates :name, :city, :address, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { in: 6...12 }


end
