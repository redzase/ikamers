class AddProductIdToVariants < ActiveRecord::Migration[6.1]
  def change
    add_reference :variants, :product, index: true, foreign_key: true
  end
end
