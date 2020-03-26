Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
    get '/users', to: 'users#index'
    get '/users/:id', to: 'user#show'
    post '/users', to: 'users#create'
    put 'users/update',to: 'users#update'
    delete 'users/delete',to: 'users#delete'
    
    get '/room', to: 'room#index'
    get '/room/:id', to: 'room#show'
    post '/room', to: 'room#create'
    put 'room/update',to: 'room#update'
    delete 'room/delete',to: 'room#delete'
    
    get '/booking', to: 'booking#index'
    get '/booking/:id', to: 'booking#show'
    post '/booking', to: 'booking#create'
    put 'booking/update',to: 'booking#update'
    delete 'booking/delete',to: 'booking#delete'
end
