Rails.application.routes.draw do
  # Uncomment if HMR breaks for anyone loading the app via 127.0.0.1 instead of
  # localhost — the Vite dev server's websocket is origin-locked, so the two
  # hostnames don't share a working HMR connection even though they're the same box.
  # constraints(host: "127.0.0.1") do
  #   get "(*path)", to: redirect { |params, req| "#{req.protocol}localhost:#{req.port}/#{params[:path]}" }
  # end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Suppress logging of requests for Chrome DevTools extensions to avoid error noise in development logs
  if Rails.env.development?
    get "/.well-known/appspecific/com.chrome.devtools.json", to: proc { [204, {}, []] }
  end

  root to: "pages#home"

  controller :pages do
    get "/", as: :home, action: :home
  end

  resources :people, only: [:index, :show, :new, :create, :edit, :update]

  resources :groups, only: [:index, :show, :new, :create, :edit, :update] do
    resources :group_memberships, only: [:create, :destroy]
  end
end
