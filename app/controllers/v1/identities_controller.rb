module V1
  class IdentitiesController < ApplicationController
    expose(:identity) { current_user.identities.find_by(provider: params[:provider]) }

    def destroy
      identity.destroy

      respond_with current_user, serializer: ProfileSerializer
    end
  end
end
