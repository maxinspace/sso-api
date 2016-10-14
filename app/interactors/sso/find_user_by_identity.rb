module SSO
  class FindUserByIdentity
    include Interactor

    delegate :auth_data, to: :context

    def call
      identity = Identity.find_by(uid: uid, provider: provider)

      context.user = identity.user if identity
    end

    private

    def uid
      auth_data["uid"]
    end

    def provider
      auth_data["provider"]
    end
  end
end
