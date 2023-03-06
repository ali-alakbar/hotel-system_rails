
# == Schema Information == 
#
# Table name: room
#
#  resereved             :boolean    
#  room_number           :string    
#  floor_number          :string      
#  max_capacity          :integer     
#  price                 :float
#  hotel_id              :string
# ==================

class Room < ApplicationRecord

  belongs_to :hotel


  validates :room_number, presence: true, uniqueness: true
  validates :floor_number, presence: true
  validates :price, presence: true, numericality: { only_float: true, greater_than: 3 }
  validates :max_capacity, presence: true, numericality: { only_integer: true, smaller_than: 7 }


  private

  def self.ransackable_associations(auth_object = nil)
    ["hotel"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["from_date_cont", "to_date_cont", "room_number", "price"]
  end
end
