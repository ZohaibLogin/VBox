Rails.application.routes.draw do
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

  #Home

  root 'home#index', as: :home

  get '/trending' => 'home#trending'

  get '/music_trends' => 'home#music_trends'

  get '/live_channels' => 'home#live_channels'

  get '/most_viewed' => 'home#most_viewed'

  get '/comedy_time' => 'home#comedy_time'

  get '/bollywood' => 'home#bollywood'

  get '/drama' => 'home#drama'

  get '/movies' => 'home#movies'

  get '/music' => 'home#music'

  get '/comedy' => 'home#comedy'

  get '/cooking' => 'home#cooking'

  get '/fashion' => 'home#fashion'

  get '/search' => 'home#search'

  get '/video' => 'home#video'

  get '/song' => 'home#song'

  get '/mashups' => 'home#mashups'
  get '/bhangra' => 'home#bhangra'
  get '/sufi' => 'home#sufi'
  get '/sad' => 'home#sad'
  get '/slow' => 'home#slow'
  get '/romantic' => 'home#romantic'
  get '/party' => 'home#party'
  get '/latest_music' => 'home#latest_music'
  get '/featured_artists' => 'home#featured_artists'
  
  get '/edit_playlists' => 'home#edit_playlists'

  get '/playlists' => 'home#playlists'

  get '/favorites' => 'home#favorites'

  get '/album' => 'home#album'

  get '/videos' => 'home#videos'

  get '/vbox_app' => 'home#vbox_app'

  # Ajax
  match '/ajax/:call' => 'ajax#handler', via: [:get, :put, :post, :delete], as: :ajax_action

end
