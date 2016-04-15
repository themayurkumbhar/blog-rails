Rails.application.routes.draw do
  
  get 'welcome/index'

  devise_for :users

Rails.application.routes.draw do
  root 'welcome#index'
end

get 'pages/about'
  get 'pages/contact'
  
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
end
