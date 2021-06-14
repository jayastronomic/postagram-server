Rails.application.routes.draw do
  Rails.application.routes.draw do
    namespace 'api' do
     namespace 'v1' do
       post '/login', to: 'sessions#create'
       delete '/logout', to: 'sessions#destroy'
       get '/logged_in', to: 'sessions#is_logged_in?'
       resources :users, only: [ :index, :create, :show, :update] do
        resources :follows, only: [:create, :destroy]
        resources :likes, only: [:index, :create, :destroy]
        get '/user_posts', to: 'posts#user_posts'
       end
       resources :posts, only: [:index, :create, :destroy, :show] 
       end
     end
   end
end
