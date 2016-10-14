class GoogleOauth2
  attr_reader :auth_data

  def initialize(auth_data)
    @auth_data = auth_data
  end

  def data
    {
      first_name: auth_data["info"]["first_name"],
      last_name: auth_data["info"]["last_name"],
      bio: ""
    }
  end
end
