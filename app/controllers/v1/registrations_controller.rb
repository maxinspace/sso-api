module V1
  class RegistrationsController < Devise::RegistrationsController
    wrap_parameters :user

    def create
      build_resource(sign_up_params)
      resource.save

      respond_with resource, serializer: SessionSerializer
    end
  end
end
