module SSO
  class UpdateProfile
    include Interactor

    delegate :auth_data, :user, to: :context

    def call
      oauth_data.each do |attribute, value|
        user[attribute] = value if user[attribute].blank? && value.present?
      end

      user.save
    end

    private

    def oauth_data
      GoogleOauth2.new(context.auth_data).data
    end
  end
end
