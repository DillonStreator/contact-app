Rails.application.routes.draw do
  get "/" => "contacts#home"
  get "/home" => "contacts#home"
  get "/contacts" => "contacts#index"
  get "/contacts/new" => "contacts#new"
  post "/contacts/create" => "contacts#create"
  get "/contacts/:id" => "contacts#show"
  get "/contacts/edit/:id" => "contacts#edit"
  patch "/contacts/update/:id" => "contacts#update"
  delete "/contacts/destroy/:id" => "contacts#destroy"
  post "/contacts/search" => "contacts#search"
end
