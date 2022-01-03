Rails.application.routes.draw do
  draw :madmin
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }

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
