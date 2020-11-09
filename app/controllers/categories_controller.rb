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


end