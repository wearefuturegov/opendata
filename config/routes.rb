Rails.application.routes.draw do
  resources :audiences do
    resources :areas
    member do
      get 'breakdown'
    end
  end

  resources :areas, :only => ["show", "index"] do
    resources :audiences, :only => "show" do
      resources :notices
      resources :fund_verticals, :only => "show"
    end
  end

  root 'areas#index'

  get 'styleguide' => 'pages#styleguide'

end
