class Merchant < ApplicationRecord
    has_many :product, dependent: :destroy
end
