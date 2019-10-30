Rails.application.routes.draw do
  scope namespace: 'api' do
    namespace :v1 do
      resources :jobs
      resources :companies do
        resources :jobs
      end
    end
  end

  match "*path", to: "application#catch_404", via: :all
end
