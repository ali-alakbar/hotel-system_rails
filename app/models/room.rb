class Room < ApplicationRecord
  validates :room_number, presence: true, uniqueness: true
  validates :floor_number, presence: true
  validates :price, presence: true, numericality: { only_float: true, greater_than: 3 }
  validates :max_capacity, presence: true, numericality: { only_integer: true, smaller_than: 7 }
  validate :validate_reserved

  private

  def validate_reserved
    errors.add(:reserved, 'must be reserved') unless reserved == true
  end

end
