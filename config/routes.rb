Rails.application.routes.draw do
  root to: 'tickets#new'
  resources :tickets
  resources :shows
end
