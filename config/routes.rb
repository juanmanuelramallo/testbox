Rails.application.routes.draw do
  resources :inbound_emails, only: :index
  root "inbound_emails#index"
end
