TravelApp::Application.routes.draw do

  resources :destinations do
    resources :attractions
  end
end
