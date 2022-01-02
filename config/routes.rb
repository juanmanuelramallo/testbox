Rails.application.routes.draw do
  devise_for :users
  resources :accounts, only: [:new, :create] do
    resources :inboxes, only: [:index, :create] do
      resources :inbound_emails, only: [:show, :index, :destroy] do
        resources :attachments, only: :show
      end
    end
  end

  resources :inboxes, only: :destroy

  root "inboxes#index"
end
