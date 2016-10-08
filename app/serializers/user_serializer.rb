class UserSerializer < ApplicationSerializer
  attributes :id, :email, :password_set_by_user, :first_name, :last_name, :bio
end
