# frozen_string_literal: true

# == Schema Information ==
#
# Table name: Guest
#
#  full_name en          :string
#  full_name ar          :string
#  id card number        :integer
#  passport_number       :string
#  mobile number         :integer
#  email                 :string
#  birthdate             :date
# ==================

class Guest < ApplicationRecord
  # ======================== MODULES INCLUSION ====================== #
  # ======================== CONSTANTS ============================== #
  # ======================== SCOPES ================================= #
  # ======================== ENUMS ================================== #
  # ======================== ASSOCIATIONS =========================== #
  has_many :bookings_guests, dependent: :destroy
  has_many :bookings, through: :bookings_guests, dependent: :destroy
  has_many :ggg, dependent:  :destroy, class_name: 'BookingsGuest'

  # ======================== VALIDATIONS ============================ #
  validates :birthday, presence: true
  validates :full_name_ar, :full_name_en, :mobile_number, :passport_number, :id_card_number, presence: true, 
  length: { minimum: 6, message: "Should be more than six characters" }
  validates :mobile_number, :passport_number, :id_card_number, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # ======================== CALLBACKS ============================== #
  # ======================== OTHERS ================================= #
  
  private
  
  # ======================== CLASS METHODS ========================== #
  # ======================== INSTANCE METHODS ======================= #
  def valid_birthday
    if birthday.present? && ( birthday < Date.new(1970, 1, 1) || birthday > Date.new(2020, 1, 1) )
      errors.add(:birthday, "is invalid")
    end
  end
end