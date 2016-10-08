class CreateUser
  include Interactor

  def call
    context.user = User.create(context.params)
  end
end
