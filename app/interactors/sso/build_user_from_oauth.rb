module SSO
  class BuildUserFromOauth
    include Interactor

    delegate :auth_data, to: :context

    def call
      context.user = find_user_by_identity || add_identity_to_email_user || create_user

      context.user
    end

    private

    def find_user_by_identity
      FindUserByIdentity.call(auth_data: auth_data).user
    end

    def add_identity_to_email_user
      result = AddIdentityToEmailUser.call(auth_data: auth_data)
      context.fail!(error: result.error) if result.failure?

      result.user
    end

    def create_user
      CreateUser.call(auth_data: auth_data).user
    end
  end
end
