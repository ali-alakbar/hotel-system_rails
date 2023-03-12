
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

  validates :check_in_date, :check_out_date, presence: true
  validates :room_id, uniqueness: true

  validate :valid_check_date

  extend Enumerize
  enumerize :status, in: { pending: 1 , confirmed: 2, canceled: 3 }

  delegate :reserved, to: :room, prefix: true

  after_update :send_confirmation_email, if: -> { status == 2 }
  after_update :send_notofication_email, if: -> { status == 1 || status == 3 }

  attr_accessor :duration

  def duration
    (check_out_date - check_in_date).to_i
  end

  private


  def self.reserved
    # if Booking.confirmed(room_id)
    #   self.room.reserved= true
    # else
    #   self.room.reserved= false
    # end
  end

  def send_notofication_email
    BookingMailer.send_notofication_email(self).deliver_now
  end
  

  def send_confirmation_email
    BookingMailer.send_confirmation_email(self).deliver_now
  end
  
  def valid_check_date
    if (check_in_date.present? && check_out_date.present?) && ( check_in_date >= check_out_date )
      errors.add(:Date, "is invalid.")
    end
  end

end
