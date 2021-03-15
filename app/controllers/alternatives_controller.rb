class AlternativesController < ApplicationController
  def index
    matching_alternatives = Alternative.all

    @list_of_alternatives = matching_alternatives.order({ :created_at => :desc })

    render({ :template => "alternatives/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_alternatives = Alternative.where({ :id => the_id })

    @the_alternative = matching_alternatives.at(0)

    render({ :template => "alternatives/show.html.erb" })
  end

  def create
    the_alternative = Alternative.new
    the_alternative.original_ingredient_id = params.fetch("query_original_ingredient_id")
    the_alternative.alternative_ingredient_id = params.fetch("query_alternative_ingredient_id")

    if the_alternative.valid?
      the_alternative.save
      redirect_to("/alternatives", { :notice => "Alternative created successfully." })
    else
      redirect_to("/alternatives", { :notice => "Alternative failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_alternative = Alternative.where({ :id => the_id }).at(0)

    the_alternative.original_ingredient_id = params.fetch("query_original_ingredient_id")
    the_alternative.alternative_ingredient_id = params.fetch("query_alternative_ingredient_id")

    if the_alternative.valid?
      the_alternative.save
      redirect_to("/alternatives/#{the_alternative.id}", { :notice => "Alternative updated successfully."} )
    else
      redirect_to("/alternatives/#{the_alternative.id}", { :alert => "Alternative failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_alternative = Alternative.where({ :id => the_id }).at(0)

    the_alternative.destroy

    redirect_to("/alternatives", { :notice => "Alternative deleted successfully."} )
  end
end
