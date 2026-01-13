Rails.application.routes.draw do
  resources :appointments
  resources :services

  resources :barbers do
    member do
      get :edit_weekly_schedule
      patch :update_weekly_schedule
    end
  end

  resources :barber_shops
end
