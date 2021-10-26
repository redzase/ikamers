class UsersController < ApplicationController
    skip_before_action :authenticate_request
  
    def register
      @user = User.create!(user_params)
      if @user.save
        render(json: { 
            success: true,
            code: 201,
            message: "Register successfully"
          }, status: :created
        )
      else
        render(json: {success: false, code: 400, message: "Error", error: @user.errors }, status: :bad)
      end
    end
  
    private
  
    def user_params
      params.permit(:name, :email, :password)
    end
end