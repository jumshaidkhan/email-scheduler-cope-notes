# frozen_string_literal: true

Rails.application.routes.draw do
  draw(:api_v1)
  devise_for :users
  root to: "home_page#index"  
end
