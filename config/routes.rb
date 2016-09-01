Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get     "/jobs"           =>      "jobs#index"
  get     "/jobs/:username" =>  "jobs#showuid"
  get     "/jobs/:zip"      =>      "jobs#showzip"
  post    "/jobs/new"       =>      "jobs#create"
  put     "/jobs/:name"     =>      "jobs#update"
  delete  "/jobs/:name"     =>      "jobs#destroy"

end
