Rails.application.routes.draw do
  Rails.application.routes.draw do
    namespace 'api' do
     namespace 'v1' do
       post '/login', to: 'sessions#create'
       delete '/logout', to: 'sessions#destroy'
       get '/logged_in', to: 'sessions#is_logged_in?'
       resources :users, only: [:create, :show, :update]
       resources :posts, only: [:index, :create]
       end
     end
   end
end
