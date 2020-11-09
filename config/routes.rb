Rails.application.routes.draw do
get("/", { :controller => "categories", :action => "index"})
get("/categories", { :controller => "categories", :action => "index"})
get("/savings", { :controller => "savings", :action => "from_user"})
get("/savings/new", { :controller => "savings", :action => "index"})
get("/savings/:category", { :controller => "savings", :action => "sum_up"})
get("/savings/delete/:category", { :controller => "savings", :action => "delete_them"})
get("/completed_goal/:goal_id", { :controller => "savings", :action => "done"})







end
