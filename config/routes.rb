Rails.application.routes.draw do
	
	resources :rsas do
		#resources :id do
			resources :encrypt_messages
			resources :decrypt_messages
		#end
	end
	
	root 'rsas#index'
end
