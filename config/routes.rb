Rails.application.routes.draw do
  resources :currencies, only: [:index, :show] do
    collection do
      get :capture
      get :chart_data
    end
  end

  root 'currencies#index'
end
