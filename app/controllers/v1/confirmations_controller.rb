module V1
  class ConfirmationsController < Devise::ConfirmationsController
    acts_as_token_authentication_handler_for User, only: []

    def show
      ConfirmByToken.call(token: params[:confirmation_token])

      redirect_to Rails.application.secrets.frontend_url
    end
  end
end
