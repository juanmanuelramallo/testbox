Rails.application.routes.draw do
  resources :inbound_emails, only: [:show, :index, :destroy] do
    resources :attachments, only: :show
  end

  root "inbound_emails#index"
end
