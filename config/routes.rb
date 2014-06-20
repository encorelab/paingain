Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  comfy_route :cms_admin, :path => '/admin'

  namespace :admin do
    resources :users
    resources :groups
  end

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false

end
