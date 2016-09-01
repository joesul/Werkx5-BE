Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get     "/jobs"                =>      "jobs#index"
  get     "/jobs/list/:username" =>      "jobs#list"
  get     "/jobs/work/:username" =>      "jobs#work"
  get     "/jobs/:zip"           =>      "jobs#show"
  post    "/jobs/new"            =>      "jobs#create"
  put     "/jobs/take/:id"       =>      "jobs#take"
  delete  "/jobs/:name"          =>      "jobs#destroy"
end
