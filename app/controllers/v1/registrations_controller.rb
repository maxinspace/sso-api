module V1
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :authenticate_scope!, only: [:update]

    wrap_parameters :user

    def create
      build_resource(sign_up_params)
      resource.save

      respond_with resource, serializer: SessionSerializer
    end

    def update
      current_user.update_with_password(account_update_params)

      respond_with current_user
    end
  end
end
