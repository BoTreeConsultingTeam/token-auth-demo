class ProductsController < ApplicationController
 before_action :authenticate

  def index products = Product.all
    render json: products, status: 200
  end

  protected
  def authenticate
    authenticate_or_request_with_http_token('Premium') do |token, options|
      User.find_by(auth_token: token)
    end
  end

  ##second way with customized unauthenticated message response
  # protected
  # def authenticate
  #   authenticate_token || render_unauthorized
  # end

  # def authenticate_token
  #   authenticate_with_http_token do |token, options|
  #     User.find_by(auth_token: token)
  #   end
  # end

  # def render_unauthorized
  #   self.headers['WWW-Authenticate'] = 'Token realm="Application"'
  #   render json: 'Bad credentials', status: 401
  # end
end
