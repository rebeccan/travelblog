Travelblog::Application.routes.draw do
  devise_for :users, :skip => [:registrations]
  #prohibit new registrations, but allow to edit profile
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'journeys#index'

  resources :journeys do
    resources :posts
  end
  
  resources :posts do
    resources :comments
    resources :likes
  end

  get 'posts/create/:journey' => 'posts#create', :as => "create_identified_journey_post"
  get 'posts/new/:journey' => 'posts#new', :as => "new_identified_journey_post"
  
  resources :galleries do
    resources :photos
  end
  
  resources :photos, only: [:show, :new, :create, :destroy]
  
  resources :settings, only: [:index, :edit, :update]

  get 'maps/data/:map(/:journey)(/:post).js' => 'maps#data', :as => "maps_data", :format => "js"
  get 'maps/data/:journey/(:post)' => 'maps#journey_bubble'
  match 'maps/marker_edit/:type/add' => 'maps#add_marker', :as => "marker_add", via: :all
  match 'maps/marker_edit/:type/edit' => 'maps#edit_marker', :as => "marker_edit", via: :all
  match 'maps/marker_edit/:type/del' => 'maps#del_marker', :as => "marker_del", via: :all

  get 'maps/marker/(:color)' => 'maps_marker#marker', :as => "marker", :format => "png"
  get 'maps/marker_check/(:color)' => 'maps_marker#marker_check', :as => "marker_check", :format => "json"

  ### EXAMPLES ###

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
