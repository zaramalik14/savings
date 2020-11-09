class SavingsController < ApplicationController

  def from_user
    #Parameters: {"new_category"=>"food", "new_goal"=>"100", "new_win"=>"hi"}
    category = params.fetch("new_category")
    goal = params.fetch("new_goal")
    win = params.fetch("new_win")

    a_goal = Target.new
    a_goal.category = category
    a_goal.goal = goal
    a_goal.gift = win
    a_goal.save
    
    render({ :template => "saving_templates/from_user.html.erb"})
  end

  def index
    #Parameters: {"user_amount"=>"50", "user_by_doing"=>"walking", "user_instead_of"=>"ubering"}
    what_was_saved = params.fetch("user_amount")
    by = params.fetch("user_by_doing")
    instead = params.fetch("user_instead_of")
    category = params.fetch("user_category")

    new_entry = Saving.new
    new_entry.amount = what_was_saved
    new_entry.by_doing = by
    new_entry.instead_of = instead
    new_entry.category = category
    new_entry.save

    @savings = Saving.all

    new_link = Link.new
    new_link.target_id = Target.where({ :category => category}).at(0).id
    new_link.saving_id = Saving.where({ :amount => what_was_saved}).at(0).id
    new_link.save
    
    render({ :template => "saving_templates/index.html.erb"})

  end

  def sum_up
    #Parameters: {"category"=>"food"}
    @category = params.fetch("category")

    counting = Array.new

    @find = Saving.where({ :category => @category})
    @find.each do |a_count|
      counting.push(a_count.amount)
    end

    @total = counting.sum

    @the_goal = Target.where({ :category => @category}).at(0).goal.to_i
    @the_win = Target.where({ :category => @category}).at(0).gift

    if @total >= @the_goal
      redirect_to("/savings/delete/" + @category)
    else 
      render({ :template => "saving_templates/sum_up.html.erb"})
    end
  end

  def delete_them
    #Parameters: {"category"=>"food"}
    category = params.fetch("category")
    find = Saving.where({ :category => category})

    find.each do |bye|
      bye.destroy
    end

    other_find = Target.where({ :category => category}).at(0)
    redirect_to("/completed_goal/" + other_find.id.to_s)

    #render({ :template => "saving_templates/delete_them.html.erb"})
  end

  def done
    #Parameters: {"goal_id"=>"7"}
    the_goal = params.fetch("goal_id")
    
    render({ :template => "saving_templates/done.html.erb"})

  end
end