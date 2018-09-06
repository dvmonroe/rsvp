Rails.application.routes.draw do
  root "reservations#index"
  get "/:id", to: "reservations#show"
  put "/:id", to: "reservations#update", as: "reservation"
end
