Rails.application.routes.draw do
  get '*path', to: 'requester#get', headers: :any
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
