Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users,
    path: 'auth',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'account'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }, defaults: { format: :json }

  resources :members, only: :index, defaults: { format: :json }
end
