Rails.application.routes.draw do
  resources :inboxes, only: [:index, :show, :create] do
    resources :inbound_emails, only: [:show, :index, :destroy] do
      resources :attachments, only: :show
    end
  end

  root "inboxes#index"
end
