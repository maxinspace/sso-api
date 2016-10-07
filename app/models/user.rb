class User < ActiveRecord::Base
  OMNIAUTH_PROVIDERS = %i(google_oauth2).freeze

  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
    :recoverable, :trackable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: OMNIAUTH_PROVIDERS

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data["email"])

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data["name"],
    #        email: data["email"],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end
end
