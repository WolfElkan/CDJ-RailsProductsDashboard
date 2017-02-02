Rails.application.routes.draw do

  get    'products'          => 'products#index'

  get    'products/new'      => 'products#new'

  post   'products'          => 'products#create'

  get    'products/:id'      => 'products#show'

  put    'products/:id'      => 'products#update'

  delete 'products/:id'      => 'products#destroy'

  get    'products/:id/edit' => 'products#edit'

  get    '/test'             => 'products#test'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
