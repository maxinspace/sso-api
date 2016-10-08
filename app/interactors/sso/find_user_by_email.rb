module SSO
  class FindUserByEmail
    include Interactor

    delegate :auth_data, to: :context

    def call
      user = User.find_by(email: email)
      SaveIdentity.call(user: user, auth_data: auth_data) if user

      context.user = user
    end

    private

    def email
      auth_data.dig(:info, :email)
    end
  end
end
