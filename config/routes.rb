Rails.application.routes.draw do

  resources :bcarts, except: [:edit,:show,:new,:update]
  resources :posts
  resources :category1s do
    resources :items
  end
  get 'project/index'
  devise_for :users,path: '',path_names: { sign_in: 'login', sign_out: 'logout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'quotation' ,to: 'quotation#quotation'
  get 'site/index'

  # root to:'site#index'
  # root :to => redirect("/login")
  get 'site/ps1'
  get 'site/zero_division_error'
  get 'site/news_page'




  # root 'quotation#quotation'
  get 'quotation', to:'quotation#quotation'
  get 'index', to:'quotation#index'
  get 'export',to: 'quotation#export'
  post 'uploadFile', to:'quotation#uploadFile'
  # get 'about' ,to: 'articles#about'
  post '/quotation', to:'quotation#quotation'
  post 'quotation/quotation'
  get 'sql',to: 'quotation#sql'
  get 'sql1',to: 'quotation#sql1'
  get 'quotation/ps2'

  get 'document',to:'quotation#Document'
  get 'ps4',to:'quotation#ps4'
  get 'profile_me/:id',to:'project#profile',as:'profile_me'
  get "addcart",to:'project#add'
  get "viewcart",to:'project#cart'
  get "myposts",to:'project#myposts'
  get "booking",to:'project#booking'
  get "myorders",to:'project#myorders'
  get "myadminorders",to:'project#adminorders'
  get "payment",to:'project#payment'
  # root to:'project#index'
  root to:"category1s#index"
end
