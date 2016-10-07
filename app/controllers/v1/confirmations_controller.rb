module V1
  class ConfirmationsController < Devise::ConfirmationsController
    FRONTEND_URL = ENV["FRONTEND_URL"]

    def show
      resource_class.confirm_by_token(params[:confirmation_token])

      redirect_to FRONTEND_URL
    end
  end
end
