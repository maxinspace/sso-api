module SSO
  class SaveIdentity
    include Interactor

    delegate :auth_data, :user, to: :context

    def call
      context.identity = Identity.create(
        uid: uid,
        provider: provider,
        user: user
      )
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
