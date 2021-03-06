ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  # map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users, :collection => {:change_password_form => :get},
                        :member => {:change_password => :put}
  map.resource :session
  map.root :controller => 'sessions', :action => 'new'

  map.dashboard '/dashboard',:controller => 'dashboard', :action => 'index'

  map.resources :materials,:member => {:iframe_show=>:get}

  map.resources :categories,:collection =>{:sku=>:get}

  map.resources :regions

  map.resources :salesreps

  map.resources :order_line_item_raws,:member=>{:check_provide=>:get,
                                                :update_status=>:put,
                                                :print=>:get},
                                      :collection=>{:load_data=>:get,
                                                    :ext_update=>:put,
                                                    :ext_destroy=>:post}

  map.resources :order_line_item_adjusteds,:collection=>{:load_data=>:get,
                                                         :ext_update=>:put}

  map.resources :order_line_item_applies,:member=>{:update_status=>:put,
                                                   :apply_update=>:put,
                                                   :print=>:get,
                                                   :accept_fail_message=>:get,
                                                   :accept_fail=>:put},
                                         :collection=>{:ext_index=>:post,
                                                       :update_checked=>:put,
                                                       :calculate_materials=>:get}

  map.resources :orders,:member=>{:approve_fail_message=>:get,
                                  :approve_fail=>:put,
                                  :accept_fail_message=>:get,
                                  :accept_fail=>:put,
                                  :provide=>:get,
                                  :print=>:get,
                                  :generate_excel=>:get},
                        :collection=>{:ext_index=>:post}

  map.resources :productions,:member=>{:print=>:get,:load_data=>:get,:generate_excel=>:get}

  map.resources :production_line_items, :collection=>{:ext_update=>:put}

  map.resources :inventories, :collection => {:calculate_materials=>:get,
                                              :ext_index=>:get,
                                              :rc_apply=>:get}

  map.resources :transfers

  map.resources :transfer_line_items

  map.resources :campaigns, :member => {:book => :get,:production=>:get},
                            :collection => {:raw => :post}

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
end
