# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: proc { [404, {}, [""]] }

  devise_for :users,
    path: "auth",
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      registration: "account",
    },
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
    },
    defaults: { format: :json }

  resources :members, only: :index, defaults: { format: :json }
  resources :phone_number_verifications, only: [:create] do
    collection do
      post "verify_otp"
      post "resend_otp"
    end
  end
end
