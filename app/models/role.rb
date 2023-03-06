class Role < ApplicationRecord
  
  has_many :employees, dependent: :destroy


  def self.ransackable_attributes(auth_object = nil)
    super & %w[name_en]
  end

  
end
