module V1
  class PasswordsController < ApplicationController
    def set
      current_user.update(
        password: params[:password],
        password_confirmation: params[:password],
        password_set_by_user: true
      )

      respond_with current_user, serializer: UserSerializer
    end
  end
end
