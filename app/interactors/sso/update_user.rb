class UpdateUser
  include Interactor

  def call
    context.user.update_with_password(context.params)
  end
end
