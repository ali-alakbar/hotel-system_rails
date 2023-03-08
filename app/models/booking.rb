
# == Schema Information == 
#
# Table name: bookings
#
#  room_id            :integer    
#  employee_id        :integer    
#  check_in_date      :date      
#  check_out_date     :date      
#  holder_id          :string      
#  status             :integer
# ==================


class Booking < ApplicationRecord
  
  has_many :bookings_guests, class_name: 'BookingGuest'
  has_many :guests, through: :bookings_guests
  belongs_to :holder, class_name: "Guest"

  belongs_to :room
  belongs_to :employee

  validates :room_id, :holder_id, :employee_id, :check_in_date, :check_out_date, presence: true
  validates :holder_id, presence: true, uniqueness: true, length: { maximum: 10, message: "Length should not be more than 10" }

  validate :valid_check_date

  extend Enumerize
  enumerize :status, in: { pending: 1 , confirmed: 2, canceled: 3 }

  after_update :update_room_reserved_status

  private

  def update_room_reserved_status
    if self.status == 2
      self.room.reserved= true
    else
      self.room.reserved= false
    end
  end

  def check_reserved_room
    if self.status == 2
      
    end
  end

  def valid_check_date
    if (check_in_date.present? && check_out_date.present?) && ( check_in_date >= check_out_date )
      errors.add(:Date, "is invalid.")
    end
  end


end
