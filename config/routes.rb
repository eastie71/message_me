Rails.application.routes.draw do
	root 'chatroom#index'

	get 'signup', to: 'users#new'
	post 'signup', to: 'users#create'
	resources :users, except: [:new,:create,:index,:show,:destroy]

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	
	post 'message', to: 'messages#create'

	mount ActionCable.server, at: '/cable'
end
