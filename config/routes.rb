Rails.application.routes.draw do
  get "/home" => "contacts#home"
  get "/index" => "contacts#index"
  get "/index/new" => "contacts#new"
  post "/index/create" => "contacts#create"
  get "/index/show/:id" => "contacts#show"
  get "/index/edit/:id" => "contacts#edit"
  patch "/index/update/:id" => "contacts#update"
  delete "/index/destroy/:id" => "contacts#destroy"
end
