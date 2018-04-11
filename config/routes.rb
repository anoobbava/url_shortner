# routing details of the app

Rails.application.routes.draw do
  apipie
  root 'urls#redirect_to_original_url'
  resource :url do
    get 'redirect_to_original_url'
  end
end
