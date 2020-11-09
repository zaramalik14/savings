class SavingsController < ApplicationController

  def from_user

    require "date"
    @the_day = Time.now.strftime("%D")
    
    render({ :template => "saving_templates/from_user.html.erb"})
  end

  def created
  #Parameters: {"user_amount"=>"50", "user_by_doing"=>"walking", "user_instead_of"=>"ubering"}
    what_was_saved = params.fetch("user_amount")
    by = params.fetch("user_by_doing")
    instead = params.fetch("user_instead_of")
    category = params.fetch("user_category")
    day = params.fetch("user_date")

    new_entry = Saving.new
    new_entry.amount = what_was_saved
    new_entry.by_doing = by
    new_entry.instead_of = instead
    new_entry.category = category
    new_entry.day_created = day
    new_entry.save

    @savings = Saving.all

    require "date"
    @the_day = Time.now.strftime("%D")

    render({ :template => "saving_templates/from_user.html.erb"})

  end

  def index
    @savings = Saving.all
    
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

    
    redirect_to("/completed_goal")

    #render({ :template => "saving_templates/delete_them.html.erb"})
  end

  def done
    #Parameters: {"goal_id"=>"7"}
  

    render({ :template => "saving_templates/done.html.erb"})

  end

  def update
   #Parameters: {"category"=>"Money", "amount"=>"20", "by"=>"eating at home", "instead"=>"at a restaurant"}
   @category_here = params.fetch("category")
   @amount_here = params.fetch("amount")
   @by_here = params.fetch("by")
   @instead_here = params.fetch("instead")

   @find = Saving.where({ :by_doing => @by_here}).at(0).id
  


    
    render({ :template => "saving_templates/update.html.erb"})

  end

  def final_update
    #Parameters: {"user_category"=>"Leisure", "user_amount"=>"40", "user_by_doing"=>"", "user_instead_of"=>"", "id"=>""}
    c = params.fetch("user_category")
    a = params.fetch("user_amount")
    b = params.fetch("user_by_doing")
    i = params.fetch("user_instead_of")
    the_id = params.fetch("id")
   

    find = Saving.where({ :id => the_id }).at(0)
    find.amount = a
    find.by_doing = b
    find.instead_of = i
    find.category = c
    find.save

    redirect_to("/savings/new")
  
  end
end