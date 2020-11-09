class CategoriesController < ApplicationController
  def index
    render({ :template => "categories_templates/index.html.erb"})
  end

  def categorizing
    #Parameters: {"new_category"=>"food", "new_goal"=>"100", "new_win"=>"hi"}
    category = params.fetch("new_category")
    goal = params.fetch("new_goal")
    win = params.fetch("new_win")

    a_goal = Target.new
    a_goal.category = category
    a_goal.goal = goal
    a_goal.gift = win
    a_goal.save

    render({ :template => "categories_templates/index.html.erb"})
  end

  def list
    @the_goal = Target.all
    
    render({ :template => "categories_templates/list.html.erb"})
  end


  def update_goal
    #Parameters: {"c"=>"Calories", "go"=>"1000", "gi"=>"Going on a trip with a friend"}
    @new_category = params.fetch("c")
    @new_goal = params.fetch("go")
    @new_gift = params.fetch("gi")

    @find = Target.where({ :category => @new_category}).at(0).id
    
    
    render({ :template => "categories_templates/update_goal.html.erb"})
  



  end
  
  def update_categories
    #Parameters: {"c"=>"Calories", "go"=>"1000", "gi"=>"Going on a trip with a friend", "id"=>"18"}
    goal_update = params.fetch("updated_goal")
    gift_update = params.fetch("updated_win")
    id_here = params.fetch("id")

    find = Target.where({ :id => id_here}).at(0)
    find.goal = goal_update
    find.gift = gift_update
    find.save

    redirect_to("/categories/list")
  end

  def delete_category
  #Parameters: {"id"=>"Calories"}
  the_category = params.fetch("id")

  find = Target.where({ :category => the_category}).at(0)
  find.destroy
  
  redirect_to("/")

  end
end