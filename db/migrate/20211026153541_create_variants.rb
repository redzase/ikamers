class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :name
      t.text :description
      t.integer :price_cents
      t.integer :quantity

      t.timestamps
    end
  end
end
