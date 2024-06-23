Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  root "hello#index"

  get "/sandbox", to: "dev#sandbox"
  get "/voyager", to: "dev#voyager"
end
