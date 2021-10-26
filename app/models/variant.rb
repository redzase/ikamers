class Variant < ApplicationRecord
    monetize :price_cents, numericality: true
    validates_presence_of :name, :price, :quantity
    belongs_to :product  
end
