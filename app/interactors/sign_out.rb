class SignOut
  include Interactor

  def call
    context.user.update_column(:authentication_token, nil)
  end
end
