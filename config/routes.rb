Rails.application.routes.draw do
  resources :audiences do
    resources :areas
  end

  resources :areas, :only => ["show", "index"] do
    resources :audiences, :only => "show" do
      resources :notices
      resources :fund_verticals
    end
  end

  root 'areas#index'

  get 'styleguide' => 'pages#styleguide'

end
