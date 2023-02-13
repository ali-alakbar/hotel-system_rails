

# == Schema Information
#
# Table name: employees
#
#  name            :string    
#  string          :string    
#  address         :string            
#  phone_number    :string

# ==================



class Hotel < ApplicationRecord
    has_many :rooms, dependent: :destroy
    has_many :employees, dependent: :destroy

end
