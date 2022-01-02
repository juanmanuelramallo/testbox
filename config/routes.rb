Rails.application.routes.draw do
  devise_for :users
  resources :inboxes, only: [:index, :create, :destroy] do
    resources :inbound_emails, only: [:show, :index, :destroy] do
      resources :attachments, only: :show
    end
  end

  root "inboxes#index"
end
