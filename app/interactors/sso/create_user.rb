module SSO
  class CreateUser
    include Interactor

    delegate :auth_data, to: :context

    def call
      SaveIdentity.call(user: user, auth_data: auth_data)

      context.user = user
    end

    private

    def user
      @user ||= User.create(
        first_name: user_info.dig(:first_name),
        last_name: user_info.dig(:last_name),
        email: user_info.dig(:email),
        password: password,
        password_confirmation: password,
        password_set_by_user: false,
        confirmed_at: Time.current
      )
    end

    def password
      @_password ||= Devise.friendly_token
    end

    def user_info
      auth_data.dig(:info)
    end
  end
end
