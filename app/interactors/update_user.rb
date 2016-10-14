class UpdateUser
  include Interactor

  delegate :user, :params, to: :context

  def call
    user.update(user_params)
  end

  private

  def user_params
    {
      password: password,
      password_confirmation: password
    }
  end

  def password
    params[:password]
  end
end
