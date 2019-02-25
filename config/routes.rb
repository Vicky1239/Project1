Rails.application.routes.draw do
	
	resources :employees do
		collection do
			get :relocation_requests
			get :ajax
		end
	end
	resources :cities
	resources :managers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
