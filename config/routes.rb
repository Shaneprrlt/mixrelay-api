Rails.application.routes.draw do

  namespace :v1, defaults: { format: :json } do

    # resources :chats, only: [:create, :show, :update, :destroy] do
    #   resources :messages, only: [:create, :update, :destroy]
    # end

    # resources :friends, only: [:index, :create, :show, :update, :destroy]

    # resources :groups, only: [:index, :create, :show, :update, :destroy]

    post 'phone_verification/send_verification_code', to: 'phone_verification#send_verification_code'
    post 'phone_verification/verify_code', to: 'phone_verification#verify_code'

    # put 'plans/:id/attend', to: 'plans#attend'
    # put 'plans/:id/unattend', to: 'plans#unattend'
    # resources :plans, only: [:index, :create, :show, :update, :destroy]

    post 'sessions/login', to: 'sessions#login'
    # post 'sessions/forgot_password', to: 'sessions#forgot_password'
    # post 'sessions/update_forgotten_password', to: 'sessions#update_forgotten_password'

    get 'users/me', to: 'users#me'
    resources :users, only: [:create, :update, :destroy]

  end
end
