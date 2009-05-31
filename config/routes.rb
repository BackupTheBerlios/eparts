ActionController::Routing::Routes.draw do |map|
  map.resources :component_housings
  map.resources :component_categories
  map.resources :configuration

  map.resources :orders
  map.resources :order_states
  map.resources :project_states
  map.resources :kicad_components
  map.resources :kicad_housings
  map.resources :stocks
  map.resources :suppliers

  map.resources :components
  map.resources :components do |c|
    c.resources :prizes
    c.resources :kicad_components
    c.resources :stocks
    c.resources :photos
    c.resources :components_photos
    c.resources :blobs
    c.resources :blobs_components
  end

  map.resources :prizes
  map.resources :prizes do |p|
    p.resources :orders
  end

  map.resources :projects
  map.resources :project_components
  map.resources :projects do |p|
    p.resources :project_components
  end

  map.resources :blobs
  map.resources :blobs_components
  map.resources :blobs do |b|
    b.resources :components
  end

  map.resources :photos
  map.resources :components_photos
  map.resources :photos do |p|
    p.resources :components
  end

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

  map.connect '', :controller => 'projects'
  map.connect ':controller/service.wsdl', :action => 'wsdl'
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
