module V1
  class RegistrationsController < Devise::RegistrationsController
    acts_as_token_authentication_handler_for User, only: :update

    skip_before_action :authenticate_scope!, only: :update

    wrap_parameters :user

    def create
      user = User.create(sign_up_params)

      respond_with user, serializer: SessionSerializer
    end
  end
end
