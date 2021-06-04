class ApplicationController < ActionController::API
  def authenticate
    authorization_header = request.headers[:Authorization]

    if authorization_header
      token = authorization_header.split[1]
      secret_key = '5496fs6a6rgra6g1'
      decoded_token = JWT.decode(token, secret_key)

      @user = User.find(decoded_token[0]['user_id'])
    else
      render status: :unauthorized
    end
  end
end
