class OrdersController < ApplicationController
    def index
        authorize!(:read)
    
        @orders = Order.all.order(id: :desc)
        render(
            json: { 
              success: true,
              code: 200,
              message: "Success", 
              data: @orders.as_json(:include => [:order_item], :except => [:user_id])  
            }
          )
    end

    def pay
        authorize!(:update)

        order = Order.find(params[:id])
        order.update(status: "paid")

        render(
            json: { 
              success: true,
              code: 200,
              message: "Paid successfully"
            }
          )
      end

end
