class User < ActiveRecord::Base
  OMNIAUTH_PROVIDERS = %i(google_oauth2).freeze

  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
    :recoverable, :trackable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: OMNIAUTH_PROVIDERS

  has_many :identities, dependent: :destroy

  validates :first_name, :last_name, length: { maximum: 255 }
end
