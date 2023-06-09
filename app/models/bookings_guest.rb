# frozen_string_literal: true

# == Schema Information ==
#
# Table name: employees
#
#  booking_id               :integer    
#  guest_id                 :integer    
# ==================

class BookingsGuest < ApplicationRecord
  # ======================== MODULES INCLUSION ====================== #
  # ======================== CONSTANTS ============================== #
  # ======================== SCOPES ================================= #
  # ======================== ENUMS ================================== #
  # ======================== ASSOCIATIONS =========================== #
  belongs_to :booking
  belongs_to :guest
  # ======================== VALIDATIONS ============================ #
  # ======================== CALLBACKS ============================== #
  # ======================== OTHERS ================================= #
  # ======================== CLASS METHODS ========================== #
  # ======================== INSTANCE METHODS ======================= #
end