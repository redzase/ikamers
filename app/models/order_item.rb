class OrderItem < ApplicationRecord
    belongs_to :order

    validates_presence_of :variant_id, :quantity, :item_price_cents, :total_price_cents

end
