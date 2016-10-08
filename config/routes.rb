Rails.application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []
  end

  namespace :v1, defaults: { format: "json" } do
    devise_scope :user do
      get "users/confirmation", to: "confirmations#show"

      post "users/sign_in", to: "sessions#create"
      post "users/sign_up", to: "registrations#create"

      put "users/set_password", to: "passwords#set"
      put "users/update", to: "registrations#update"

      delete "users/sign_out", to: "sessions#destroy"
      delete "identities/:provider", to: "identities#destroy"
    end

    devise_for :users, only: %i(omniauth_callbacks), controllers: {
      omniauth_callbacks: "v1/omniauth_callbacks"
    }
  end
end
