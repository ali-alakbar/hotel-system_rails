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
  attr_accessor :duration
  
  ## ======================== ENUMS ========================  ##
  enumerize :status, in: { pending: 1 , confirmed: 2, canceled: 3 }
  
  # ======================== SCOPES ================================= #
  ## ======================== ASSOCIATIONS ======================== ##
  has_many :bookings_guests, dependent:  :destroy
  has_many :ggg, dependent:  :destroy, class_name: 'BookingsGuest'
  has_many :guests, through: :bookings_guests, dependent:  :destroy
  belongs_to :holder, class_name: 'Guest'
  belongs_to :room
  belongs_to :employee

  ## ======================== VALIDATIONS ======================== ##
  validates :check_in_date, :check_out_date, presence: true
  validates :room_id, uniqueness: true
  validate :valid_check_date

  ## ========================- CALLBACKS ======================== ##
  after_update :send_confirmation_email, if: -> { status == 2 }
  after_update :send_notofication_email, if: -> { status == 1 || status == 3 }
  after_create :save_bookings_guests

  def duration
    (check_out_date - check_in_date).to_i
  end

  private

  # ======================== CLASS METHODS ========================== #
  # ======================== INSTANCE METHODS ======================= #
  def save_bookings_guests
    BookingsGuest.create(booking_id: id, guest_id: holder_id, check_in_date: check_in_date, check_out_date: check_out_date)
  end

  def send_notofication_email
    BookingMailer.send_notofication_email(self).deliver_now
  end
  

  def send_confirmation_email
    BookingMailer.send_confirmation_email(self).deliver_now
  end
  
  def valid_check_date
    if (check_in_date.present? && check_out_date.present?) && ( check_in_date >= check_out_date )
      errors.add(:Date, 'is invalid.')
    end
  end
end