class AuthenticateUser
  include Interactor

  def call
    context.user = authenticated_user!
  end

  private

  def authenticated_user!
    context.warden.request.env["devise.skip_trackable"] = false
    context.warden.authenticate!(store: false, scope: :user)
  end
end
