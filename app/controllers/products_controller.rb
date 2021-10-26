class ProductsController < ApplicationController
    def index
        authorize!(:read)
    
        @product = Product.search(params[:merchant_id], params[:search])
        render(
            json: { 
              success: true,
              code: 200,
              message: "Success", 
              data: @product.as_json(:include => [:category, :merchant, :variant], except: [:category_id, :merchant_id])  
            }
          )
    end
end
