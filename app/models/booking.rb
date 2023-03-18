# frozen_string_literal: true

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
  # ======================== MODULES INCLUSION ====================== #
  extend Enumerize
  # ======================== CONSTANTS ============================== #
  # ======================== OTHERS ================================= #
  ## ======================== ENUMS ========================  ##
  enumerize :status, in: { pending: 1 , confirmed: 2, canceled: 3 }
  # ======================== SCOPES ================================= #
  ## ======================== ASSOCIATIONS ======================== ##
  has_many :bookings_guests, dependent:  :destroy
  has_many :guests, through: :bookings_guests, dependent:  :destroy
  belongs_to :holder, class_name: 'Guest'
  belongs_to :room
  belongs_to :employee
  ## ======================== VALIDATIONS ======================== ##
  validates :check_in_date, :check_out_date, presence: true
  validate :valid_check_date
  ## ========================- CALLBACKS ======================== ##
  after_update :send_confirmation_email, if: -> { status.confirmed? }
  after_update :send_notofication_email, if: -> { status.pending? || status.canceled? }
  after_create :save_bookings_guests
  after_create :check_expire_date
  after_save :update_room_reservation
  
  def employee_full_name
    employee.full_name
  end

  def update_room_reservation
    return if room.reserved
    room.update(reserved: true) if status.confirmed?
  end

  def setting_duration_value
    (check_out_date - check_in_date).to_i 
  end
  
  private
  
  # ======================== CLASS METHODS ========================== #
  # ======================== INSTANCE METHODS ======================= #
  def check_expire_date
    booking_records = Booking.all.to_a
    current_date = Date.today
    booking_records.each do |record|
      record.update(status: 'canceled') if record.check_out_date.to_date < current_date
      record.update(status: 'pending') if record.check_out_date.to_date > current_date && !status.confirmed?  
    end
  end

  def save_bookings_guests
    BookingsGuest.create(booking_id: id, guest_id: holder_id)
  end

  def send_notofication_email
    BookingMailer.send_notofication_email(self).deliver_now
  end

  def send_confirmation_email
    BookingMailer.send_confirmation_email(self).deliver_now
  end
  
  def valid_check_date
    max_date = Date.today + 1.year
    errors.add(:Date, 'is invalid.') unless check_in_date <= check_out_date
    errors.add(:Date, 'should not be a year ahead.') unless check_in_date < max_date || check_out_date < max_date
  end
end