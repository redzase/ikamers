class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.successful?
      render(
        json: { 
          success: true,
          code: 200,
          message: "Login successfully", 
          data: {
            token: command.result
          }
        }
      )
    else
      render(json: {success: false, code: 401, message: "Unauthorized", error: command.errors }, status: :unauthorized)
    end
  end
end
