class ConfirmByToken
  include Interactor

  def call
    User.confirm_by_token(context.token)
  end
end
