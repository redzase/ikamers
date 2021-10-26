class CartsController < ApplicationController
  def create
      authorize!(:create)

      find  = find_order
      valid, msg  = create_order(find)

      if valid
        render(
          json: { 
            success: true,
            code: 200,
            message: "Cart updated successfully"
          }
        )
      else
        render(
          json: { 
            success: false,
            code: 400,
            message: sprintf("Failed update cart: %s", msg)
          }
        )
      end
  end

  def find_order
    order = Order.where(
      user_id: current_user.id,
      status: "on-progress"
    )
    order
  end

  def create_order(order)
    if order.count == 0
      order = Order.new(
        user_id: current_user.id,
        grand_total_quantity: cart_total_qty,
        grand_total_price_cents: cart_total_price,
        status: "on-progress"
      )
      order.save!
    else
      order.update(
        grand_total_quantity: cart_total_qty,
        grand_total_price_cents: cart_total_price,
      )
      order = order.first
    end
    
    # delete all item
    order.order_item.destroy_all

    params[:items].each do |item|
      if variant = Variant.find_by(id: item[:variant_id])
        quantity = item[:quantity].to_i
        order.order_item.new(
          order_id: order.id,
          variant_id: variant.id,
          quantity: quantity,
          item_price_cents: variant.price,
          total_price_cents: variant.price * quantity
        )
      else
        return false, sprintf("variant_id `%s` doesnt exists", item[:variant_id].to_s)
      end
    end
    order.save!
    return true, nil
  end

  # returns total of qty
  def cart_total_qty
    total = 0
    params[:items].each do |item|
      if variant = Variant.find_by(id: item[:variant_id])
        total += item[:quantity].to_i
      end
    end
    total
  end

  # returns total of amount
  def cart_total_price
    total = 0
    params[:items].each do |item|
      if variant = Variant.find_by(id: item[:variant_id])
        total += variant.price * item[:quantity].to_i
      end
    end
    total
  end
end
