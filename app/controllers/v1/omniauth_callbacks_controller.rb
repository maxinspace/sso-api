module V1
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      user = User.from_omniauth omniauth_env

      user ? find_user(user) : create_user

      respond_with(user, serializer: SessionSerializer)
    end

    private

    def omniauth_env
      request.env["omniauth.auth"]
    end

    def find_user(user)
      user.authentication_token = omniauth_env.dig(:credentials, :token)
      user.save
    end

    def create_user
      email = omniauth_env.dig(:info, :email)
      password = Devise.friendly_token
      user = User.create(
        email: email, password: password, password_confirmation: password,
        authentication_token: omniauth_env.dig(:credentials, :token), password_set_by_user: false,
        confirmed_at: Time.zone.now
      )

      user
    end
  end
end
