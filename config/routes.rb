Rails.application.routes.draw do
    root 'dojos_controller#index'

    get '/dojos' => 'dojos_controller#index'

    post '/dojos' => 'dojos_controller#create'

    get '/dojos/new' => 'dojos_controller#new'

    get '/dojos/:id' => 'dojos_controller#show'

    get '/dojos/:id/edit' => 'dojos_controller#edit'

    put '/dojos/:id' => 'dojos_controller#update'

    delete '/dojos/:id' => 'dojos_controller#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
