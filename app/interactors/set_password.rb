class SetPassword
  include Interactor

  def call
    context.user.update(
      password: context.password,
      password_confirmation: context.password,
      password_set_by_user: true
    )
  end
end
