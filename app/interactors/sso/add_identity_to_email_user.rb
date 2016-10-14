module SSO
  class AddIdentityToEmailUser
    include Interactor

    delegate :auth_data, to: :context

    def call
      find_user_by_email

      return false unless user_found?

      SaveIdentity.call(auth_data: auth_data, user: context.user)
      UpdateProfile.call(auth_data: auth_data, user: context.user)
    end

    private

    def find_user_by_email
      context.user = User.find_by(email: email)

      context.user
    end

    def user_found?
      context.user.present?
    end

    def email
      auth_data["info"]["email"]
    end
  end
end
