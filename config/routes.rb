Rails.application.routes.draw do
  resources :inbound_emails, only: [:show, :index, :destroy]
  root "inbound_emails#index"
end
