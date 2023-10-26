Rails.application.routes.draw do
  root 'articles#index'


  resources :articles

  if Rails.env.development?
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  end

end
