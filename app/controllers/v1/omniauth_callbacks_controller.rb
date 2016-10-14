module V1
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    acts_as_token_authentication_handler_for User, only: []

    def google_oauth2
      current_user ? connect : authenticate
    end

    private

    def connect
      SSO::SaveIdentity.call(auth_data: auth_data, user: current_user)
      SSO::UpdateProfile.call(auth_data: auth_data, user: current_user)

      respond_with current_user, serializer: ProfileSerializer
    end

    def authenticate
      result = SSO::AuthenticateUser.call(auth_data: auth_data)

      if result.success?
        respond_with result.user, serializer: SessionSerializer
      else
        respond_with RailsApiFormat::Error.new(error: result.error).to_json, status: 401
      end
    end

    def current_user
      @_current_user ||= User.find_by(authentication_token: request.headers["X-User-Token"])
    end

    def auth_data
      request.env["omniauth.auth"]
    end
  end
end
