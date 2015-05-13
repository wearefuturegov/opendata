Rails.application.routes.draw do
  
  resources :areas, :only => ["show", "index"] do
    resources :audiences, :only => "show" do
      resources :notices
    end
  end
  
  root 'areas#index'

  get 'styleguide' => 'pages#styleguide'

end
