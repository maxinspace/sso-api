class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  acts_as_token_authentication_handler_for User, fallback: :exception

  respond_to :json

  private

  def devise_parameter_sanitizer
    User::ParameterSanitizer.new(User, :user, params)
  end
end
