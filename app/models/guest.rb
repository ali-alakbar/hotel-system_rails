
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

  has_many :bookings_guests, class_name: 'BookingGuest'
  has_many :bookings, through: :bookings_guests

  validates :full_name_ar, :passport_number, :id_card_number, :birthday, :full_name_en, presence: true
  validates :full_name_ar, :full_name_en, :id_card_number, length: { minimum: 6, message: "Should be more than six characters" }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :mobile_number, presence: true, numericality: { only_integer: true }

  validate :valid_birthday, :valid_mobile_length

  private

  def valid_birthday
    if birthday.present? && ( birthday < Date.new(1970, 1, 1) || birthday > Date.new(2020, 1, 1) )
      errors.add(:birthday, "is invalid")
    end
  end

  def valid_mobile_length
    if mobile_number.present? && ( mobile_number.size < 5 || mobile_number.size > 15 )
      errors.add(:mobile_number, "is invalid")
    end
  end

end
