Rails.application.routes.draw do
  devise_for :users
  # ... aapke baaki routes ...

  resources :listings do
    # Isse 'listing_bookings_path' generate ho jayega
    resources :bookings, only: [ :create ]
  end

  root "listings#index"
end
