module OmniAuth
  module Strategies
    class GoogleOauth2
      def callback_phase_with_json # rubocop:disable Metrics/AbcSize
        parsed_params = env["action_dispatch.request.request_parameters"]
        if parsed_params
          request.params["code"] = parsed_params["code"] if parsed_params["code"]
          request.params["access_token"] = parsed_params["access_token"] if parsed_params["access_token"]
          request.params["id_token"] = parsed_params["id_token"] if parsed_params["id_token"]
        end
        callback_phase_without_json
      end
      alias_method_chain :callback_phase, :json
    end
  end
end
