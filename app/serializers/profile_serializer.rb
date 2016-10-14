class ProfileSerializer < UserSerializer
  attributes :first_name, :last_name, :bio

  has_many :identities
end
