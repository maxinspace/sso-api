module SSO
  class AuthenticateUser
    include Interactor

    delegate :auth_data, to: :context

    def call
      user = BuildUserFromOauth.call(auth_data: auth_data).user
      user.update(authentication_token: token)

      context.user = user
    end

    private

    def token
      auth_data["credentials"]["token"]
    end
  end
end
