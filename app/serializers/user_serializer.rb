class UserSerializer < ApplicationSerializer
  attributes :id, :email, :password_set_by_user
end
