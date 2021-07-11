Rails.application.routes.draw do
  match 'wake', to: 'requester#wake', via: [:get], headers: :any
  match '*path', to: 'requester#get', via: [:get, :post], headers: :any
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
