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
  has_many :employees, dependent: :destroy
  
  validates :name_ar, :name_en, presence: true
end