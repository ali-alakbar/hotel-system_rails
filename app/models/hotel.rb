# frozen_string_literal: true

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
  # ======================== MODULES INCLUSION ====================== #
  acts_as_api
  # ======================== CONSTANTS ============================== #
  # ======================== SCOPES ================================= #
  # ======================== ENUMS ================================== #
  # ======================== ASSOCIATIONS =========================== #
  has_many :rooms,       dependent:  :destroy
  has_many :employees,   dependent:  :destroy
  # ======================== VALIDATIONS ============================ #
  validates :name, :city, :address, presence: true
  validates :phone_number, uniqueness: true, presence: true, numericality: { only_integer: true },
                          length: { minimum: 6, maximum: 12 }
  # ======================== CALLBACKS ============================== #
  # ======================== OTHERS ================================= #
  api_accessible :details do |t|
    t.add :name
    t.add :city
    t.add :address
    t.add :phone_number
  end
  # ======================== CLASS METHODS ========================== #
  # ======================== INSTANCE METHODS ======================= #
end