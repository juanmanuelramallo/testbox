# Below are the routes for madmin
namespace :madmin do
  resources :users
  resources :inboxes
  namespace :active_storage do
    resources :attachments
  end
  namespace :active_storage do
    resources :variant_records
  end
  namespace :active_storage do
    resources :blobs
  end
  namespace :action_mailbox do
    resources :inbound_emails
  end
  resources :account_users
  resources :inbox_emails
  resources :accounts
  root to: "dashboard#show"
end
