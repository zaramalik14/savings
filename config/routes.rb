Rails.application.routes.draw do
get("/", { :controller => "categories", :action => "index"})
get("/categories", { :controller => "categories", :action => "categorizing"})
get("/savings", { :controller => "savings", :action => "from_user"})
get("/savings/new", { :controller => "savings", :action => "index"})
get("/savings/created", { :controller => "savings", :action => "created"})
get("/savings/:category", { :controller => "savings", :action => "sum_up"})
get("/savings/delete/:category", { :controller => "savings", :action => "delete_them"})
get("/completed_goal", { :controller => "savings", :action => "done"})
get("/update_savings/:category/:amount/:by/:instead", { :controller => "savings", :action => "update"})
get("/update/:category/:amount/:by/:instead/:id", { :controller => "savings", :action => "final_update"})







end
