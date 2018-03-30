Rails.application.routes.draw do

  root 'static_pages#home' 
  # 把 'static_pages/home' 路由删掉了，因此我们以后都得使用 root_path 或 root_url。
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/signup', to:'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root 'application#home'
end
