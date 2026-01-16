Rails.application.routes.draw do
  resources :appointments, only: [:create, :show] do
    patch :cancel, on: :member
  end

  resources :barbers do
    member do
      get :available_days
      get "available_slots/:date", to: "barbers#available_slots", as: :available_slots_by_date
      get :edit_weekly_schedule
      patch :update_weekly_schedule
    end
  end

  resources :barber_shops
  resources :services
end
