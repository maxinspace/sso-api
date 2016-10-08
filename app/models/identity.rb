class Identity < ActiveRecord::Base
  belongs_to :user

  validates :provider, :uid, :user, presence: true
  validates :provider, uniqueness: { scope: :uid }
end
