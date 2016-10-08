module V1
  class IdentitiesController < ApplicationController
    expose(:identity) { current_user.identities.find_by(provider: params[:provider]) }

    def destroy
      identity.destroy
      current_user.identities.reload

      respond_with current_user
    end
  end
end
