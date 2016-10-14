RSpec::Matchers.define :be_a_session_representation do
  match do |json|
    response_attributes = %w(
      email
      authentication_token
    )

    expect(json).to be
    expect(json.keys).to match_array(response_attributes)
  end
end
