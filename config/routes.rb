PeakSeason::Application.routes.draw do

  resources :regions do 
    # resources :markets do
    #   resources :market_times
    # end
  end

  # resources :markets
  
  resources :items
  # has many regions
  # belongs to many regions

  # get "/local_items" => "items#local_listing"
  # get "/local_markets" => "markets#local_listing"


  get "/local_recipes" => "recipes#local_listing"
  # get "/local_markets" => "markets#localmarkets"
  get "/markets/:id/:name" => "markets#detail"  
  get "/in_season" => "items#in_season_listing"
  get "/local_markets" => "markets#local_markets"

  # get "/geocoder" => "markets#geocoder"
  get "/getmarkets" => 'markets#getmarkets'
  # get "/local_recipes/:q" => "recipes#local_listing"
  # get "/recipes_json/:q" => "recipes#recipes_json"

  # get "/seasons" => "items#yearview"

  # get "site/welcome"
  root :to  => "site#home"

  # get "/markets/:id" => 'markets#show'
 
# This makes no good sense
# get "/regions/:id/items/:id" => 'items#show'


  

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
