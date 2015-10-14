Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  authenticated :user do
     root :to => 'dashboard#index'
   end
   
  post 'admin_dashboard/turn_cook', :as => 'change_cook'
   
  get '/' => 'static#index'
 
  resources :charges
  
  #user dashboard
  get '/users/address' => 'dashboard#address', :as => 'user_address'
  post '/users/address' => 'dashboard#update', :as => 'user_address_update'
  
  
  #admin dashboard
  get '/admin' => 'admin_dashboard#index', :as => 'admin'
  
  #cook dashboard
  get '/cook' => 'cook_dashboard#profile', :as => 'cook'
  post 'charges/save' => 'charges#save', "action" => "save"
  post 'charges/create' => 'charges#create'
  
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
