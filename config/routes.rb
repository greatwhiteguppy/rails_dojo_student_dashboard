Rails.application.routes.draw do

    #students controller 
    get 'dojos/:dojo_id/students' => 'students#index'

    get 'dojos/:dojo_id/students/new' => 'students#new'

    post 'dojos/:dojo_id/students' => 'students#create'

    get 'dojos/:dojo_id/students/:id' => 'students#show'

    get 'dojos/:dojo_id/students/:id/edit' => 'students#edit'

    put 'dojos/:dojo_id/students/:id' => 'students#update'

    delete 'dojos/:dojo_id/students/:id' => 'students#destroy'


    #dojos controller

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
