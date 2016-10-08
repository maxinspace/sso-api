module V1
  class RegistrationsController < Devise::RegistrationsController
    acts_as_token_authentication_handler_for User, only: :update

    skip_before_action :authenticate_scope!, only: :update

    wrap_parameters :user

    def create
      user = CreateUser.call(params: sign_up_params).user

      respond_with user, serializer: SessionSerializer
    end

    def update
      UpdateUser.call(user: current_user, params: account_update_params)

      respond_with current_user
    end
  end
end
