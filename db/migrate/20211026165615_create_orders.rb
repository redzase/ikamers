class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table(:orders) do |t|
      t.string(:status, null: false)
      t.integer(:grand_total_quantity)
      t.integer(:grand_total_price_cents)

      t.timestamps
    end
  end
end
