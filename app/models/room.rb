# frozen_string_literal: true

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
  # ======================== MODULES INCLUSION ====================== #
  # ======================== CONSTANTS ============================== #
  # ======================== SCOPES ================================= #
  # ======================== ENUMS ================================== #
  # ======================== ASSOCIATIONS =========================== #
  belongs_to :hotel
  has_many :bookings, dependent: :destroy

  # ======================== VALIDATIONS ============================ #
  validates :room_number, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_float: true, greater_than: 3 }
  validates :max_capacity, presence: true, numericality: { only_integer: true, smaller_than: 7 }
  validate :check_reserved_room

  # ======================== CALLBACKS ============================== #
  # ======================== OTHERS ================================= #
  # ======================== CLASS METHODS ========================== #
  # ======================== INSTANCE METHODS ======================= #  
end
