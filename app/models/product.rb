class Product < ApplicationRecord
    belongs_to :category
    belongs_to :merchant
    has_many :variant

    validates_presence_of :name

    def self.search(merchant_id, search)
        product = Product.all
        if merchant_id.present?
            product = product.where(merchant_id: merchant_id)
        end
        if search.present?
            product = product.where('name LIKE ?', "%#{search}%")
        end
        product
    end
end
