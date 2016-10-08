module V1
  class PasswordsController < ApplicationController
    def set
      SetPassword.call(user: current_user, password: params[:password])

      respond_with current_user
    end
  end
end
