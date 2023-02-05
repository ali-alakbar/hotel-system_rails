class Room < ApplicationRecord
  belongs_to :hotel
  validates :room_no, presence: true, uniqueness: true
  validates :floor_no, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 3 }
  validates :max_capacity, presence: true, numericality: { only_integer: true, smaller_than: 7 }
end
