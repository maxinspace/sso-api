module V1
  class UsersController < ApplicationController
    def show
      respond_with current_user, serializer: ProfileSerializer
    end

    def update
      UpdateUser.call(user: current_user, params: user_params)

      respond_with current_user, serializer: ProfileSerializer
    end

    private

    def user_params
      params.permit(
        :first_name,
        :last_name,
        :bio,
        :email,
        :password,
        :password_confirmation,
        :current_password
      )
    end
  end
end
