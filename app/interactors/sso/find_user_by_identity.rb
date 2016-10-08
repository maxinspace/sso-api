module SSO
  class FindUserByIdentity
    include Interactor

    delegate :auth_data, to: :context

    def call
      return unless identity

      context.user = identity.user
    end

    private

    def identity
      @_identity ||= Identity.find_by(uid: uid, provider: provider)
    end

    def uid
      auth_data["uid"]
    end

    def provider
      auth_data["provider"]
    end
  end
end
