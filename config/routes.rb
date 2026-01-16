Rails.application.routes.draw do
  resources :appointments, only: [:create, :show] do
    patch :cancel, on: :member
  end

  resources :barbers do
    member do
      get :bookable_days
      get "bookable_slots/:day", to: "barbers#bookable_slots", as: :bookable_slots_by_day
      get :edit_weekly_schedule
      patch :update_weekly_schedule
    end
  end

  resources :barber_shops
  resources :services
end
