HomesliceRe::Application.routes.draw do



  # mount Dashing::Engine, at: Dashing.config.engine_path
  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "/contact", to: "pages#contact", as: "contact"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"
  # get "index", to: "pages#index", as: "index"
  get "posts", to: "pages#posts", as: "posts"
  get "posts/:id", to: "pages#show_post", as: "post"
  devise_for :users, :controllers => {:registrations => "registrations"}
  # devise_for :agents, :controllers => {:registrations => "agents/registrations"}

  get "task/client"
  get "task/agent"
  # get "agents/sign_up", to: "agents/registrations#new", as: "new_agent_registration"

  resources :users do
    resource :account
    resource :agent_account
    resources :task_applications
    resources :activities
    resources :transactions
    resource :dashboard
  end

  scope 'agent' do
    resources :users, as: 'agent_user'
  end

  # resources :agents do
  #   resource :agent_account
  # end
  # resources :agent_steps
  resources :task_applications

  resources :comments

  resources :activities

  resources :task_assignments

  resources :transactions

  namespace :admin do
    root "base#index"
    resources :users
    get "posts/drafts", to: "posts#drafts", as: "posts_drafts"
    get "posts/dashboard", to: "posts#dashboard", as: "posts_dashboard"
    resources :posts
  end


  # view routes
  get '/widgets' => 'widgets#index'
  get '/documentation' => 'documentation#index'

  get 'dashboard/dashboard_v1'
  get 'dashboard/dashboard_v2'
  get 'dashboard/dashboard_v3'
  get 'dashboard/dashboard_h'
  get 'pages/login'
  get 'pages/register'
  get 'pages/recover'
  get 'pages/lock'
  get 'pages/template'
  get 'pages/terms'
  get 'pages/sign_up'
  # get 'pages/notfound'

  # api routes
  get '/api/documentation' => 'api#documentation'
  get '/api/datatable' => 'api#datatable'
  get '/api/jqgrid' => 'api#jqgrid'
  get '/api/jqgridtree' => 'api#jqgridtree'
  get '/api/i18n/:locale' => 'api#i18n'
  post '/api/xeditable' => 'api#xeditable'
  get '/api/xeditable-groups' => 'api#xeditablegroups'











  #
  # get 'elements/button'
  # get 'elements/notification'
  # get 'elements/spinner'
  # get 'elements/animation'
  # get 'elements/dropdown'
  # get 'elements/nestable'
  # get 'elements/sortable'
  # get 'elements/panel'
  # get 'elements/portlet'
  # get 'elements/grid'
  # get 'elements/gridmasonry'
  # get 'elements/typography'
  # get 'elements/fonticons'
  # get 'elements/weathericons'
  # get 'elements/colors'
  # get 'elements/buttons'
  # get 'elements/notifications'
  # get 'elements/carousel'
  # get 'forms/standard'
  # get 'forms/extended'
  # get 'forms/validation'
  # get 'forms/wizard'
  # get 'forms/upload'
  # get 'forms/xeditable'
  # get 'multilevel/level1'
  # get 'multilevel/level3'
  # get 'charts/flot'
  # get 'charts/radial'
  # get 'charts/chartjs'
  # get 'tables/standard'
  # get 'tables/extended'
  # get 'tables/datatable'
  # get 'tables/jqgrid'
  # get 'maps/google'
  # get 'maps/vector'
  # get 'extras/mailbox'
  # get 'extras/timeline'
  # get 'extras/calendar'
  # get 'extras/invoice'
  # get 'extras/search'
  # get 'extras/todo'
  # get 'extras/profile'

  # the rest goes to root
   get '*path' => redirect('/')

end
