# frozen_string_literal: true

# == Schema Information ==
#
# Table name: hotel
#
#  name_ar            :string
#  name_en            :string
#  hotel_id           :integer

# ==================

class Role < ApplicationRecord
  # ======================== MODULES INCLUSION ====================== #
  # ======================== CONSTANTS ============================== #
  # ======================== SCOPES ================================= #
  # ======================== ENUMS ================================== #
  # ======================== ASSOCIATIONS =========================== #
  has_many :employees, dependent: :destroy
  # ======================== VALIDATIONS ============================ #
  validates :name_ar, :name_en, presence: true
  # ======================== CALLBACKS ============================== #
  # ======================== OTHERS ================================= #
  # ======================== CLASS METHODS ========================== #
  # ======================== INSTANCE METHODS ======================= #
end