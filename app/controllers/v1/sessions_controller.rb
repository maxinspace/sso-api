module V1
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_signed_out_user, only: :destroy

    wrap_parameters :user

    def create
      user = AuthenticateUser.call(warden: warden).user

      respond_with(user, serializer: SessionSerializer)
    end

    def destroy
      current_user.update_column(:authentication_token, nil)

      respond_with current_user, status: :ok
    end
  end
end
