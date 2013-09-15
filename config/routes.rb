SeemyresuMe::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "/person/:name" => "peoples#index"
      get "/skill" => "skills#index"
      get "/testimonial" => "testimonials#index"
    end
  end

  get '/template' => "resume_templates#index"

  get '/changetemplate/:id' => "users#changetemplate"

  get '/sharing' => "users#sharing"

  post '/changesharing' => "users#changesharing"

  get '/feedback' => 'feedbacks#new'

  post '/feedbacks' => 'feedbacks#create'

  root to: "welcome#index"

  get '/me/:id' => 'users#resume'
  
  post '/authenticate' => 'users#authenticate'
  
  get '/changepassword' => 'users#changepassword'
  
  post '/changepassword' => 'users#dochangepassword'
  
  get '/logout' => 'users#logout'

  get '/profile' => "users#edit"

  get '/users' => "users#edit"

  put '/users' => "users#update"

  get '/skills' => "skills#edit"

  put '/skills' => "skills#update"

  get '/achievements' => "achievements#edit"

  put '/achievements' => "achievements#update"

  get '/schools' => "schools#edit"

  put '/schools' => "schools#update"

  get '/experiences' => "experiences#edit"

  put '/experiences' => "experiences#update"

  get '/resume' => "resumes#show"

  post '/signup' => "users#newtmp"

  get '/confirmemail/:email/:code' => "users#confirmemail", :constraints => { :email => /[^\/]+/ }

  post '/confirmuser' => "users#confirmuser"

  resources :users

  resources :skills

  resources :experiences

  resources :schools

  resources :achievements

  resources :faqs
  
  get "welcome/index"

  get "welcome/about"

  get "welcome/FAQs"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
