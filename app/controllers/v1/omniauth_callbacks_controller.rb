module V1
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      user = User.from_omniauth omniauth_env
      user.authentication_token = omniauth_env.dig(:credentials, :token)
      user.save

      respond_with(user, serializer: SessionSerializer)
    end

    private

    def omniauth_env
      request.env["omniauth.auth"]
    end
  end
end
