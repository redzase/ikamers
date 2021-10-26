class Order < ApplicationRecord
    has_many :order_item
    belongs_to :user

    validates_presence_of :user_id, :grand_total_quantity, :grand_total_price_cents
end
