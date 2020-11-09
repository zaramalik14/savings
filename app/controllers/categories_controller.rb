class CategoriesController < ApplicationController
  def index
    
    render({ :template => "categories_templates/index.html.erb"})
  end



end