app_config.middleware.insert_before "Warden::Manager", "Rack::Cors" do
  allow do
    # Allow requests from domains:
    # e.g. origins('api.example.com', 'next.example.com')
    #
    origins(*ENV.fetch("ALLOW_REQUESTS_FROM", ENV.fetch("HOST")).split(","))

    resource(
      "*",
      headers: :any,
      methods: %i(get post put delete patch options)
    )
  end
end
