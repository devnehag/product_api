class Product < ApplicationRecord
  belongs_to :category
    # Validation for name
    validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
      # Validation for price
    validates :price, numericality: { greater_than: 0 }
  end
  
