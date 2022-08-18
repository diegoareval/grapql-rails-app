Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql#execute"
  end
  post "/graphql", to: "graphql#execute"
  get "/sw.js", to: redirect('/404.html')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
