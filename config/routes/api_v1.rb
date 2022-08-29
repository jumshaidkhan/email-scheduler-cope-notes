# frozen_string_literal: true

namespace :api do
  namespace :v1, defaults: { format: :json } do
    get :status, to: 'api#status'
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :recieved_messages # , only: %i[create, update]
  end
end
