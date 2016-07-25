Rails.application.routes.draw do

  resources :accounts
  resources :moods
  resources :psychos
  resources :parents
  resources :quests
  resources :prenatals
  resources :welcome do
    collection do
      post :connect_father
    end
  end

  root :to => "welcome#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    resources :parents
    get "/parents/info/:type" => "parents#info"

    resources :quests, only: [:index, :create]
    post "/quests/:id/status" => "quests#send_read", :as => 'quests_send_read'
    post "/quests/:id/done" => "quests#send_done", :as => 'quests_send_done'

    resources :moods, only: [:index, :create]
    post "/moods/:id/status" => "orders#mood_read", :as => 'moods_send_read'

    resources :psychos, only: [:index, :create]
    post "/psychos/:id/status" => "orders#psycho_read", :as => 'psychos_send_read'

    resources :prenatals, only: [:index, :create, :update]
    post "/prenatals/:id/status" => "prenatals#send_read", :as => 'prenatals_send_read'

    #log in/log out/ sign up
    post "/login" => "auth#login"
    post "/logout" => "auth#logout"
    post "/signup" => "auth#signup"
    #connect_father
    post "/connect_father" => "parents#connect_father"
  end
    #connect_father
    get "/connect_father/:id" => "auth_father#new"
    post "/connect_father/:id" => "auth_father#signup" , :as => 'connect_father_signup'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
