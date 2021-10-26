class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :variant, index: true, foreign_key: true
      t.integer :quantity
      t.integer :item_price_cents
      t.integer :total_price_cents
    end
  end
end
