Rails.application.routes.draw do
  Rails.application.routes.draw do
    root to: 'cocktails#index'
  
    resources :cocktails, only: %i[new create index show destroy] do
      resources :doses, only: %i[new create]
    end
  
    resources :doses, only: :destroy
  end
end
