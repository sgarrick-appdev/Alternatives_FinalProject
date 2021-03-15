class OriginalIngredientsController < ApplicationController
  def index
    matching_original_ingredients = OriginalIngredient.all

    @list_of_original_ingredients = matching_original_ingredients.order({ :created_at => :desc })

    render({ :template => "original_ingredients/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_original_ingredients = OriginalIngredient.where({ :id => the_id })

    @the_original_ingredient = matching_original_ingredients.at(0)

    render({ :template => "original_ingredients/show.html.erb" })
  end

  def create
    the_original_ingredient = OriginalIngredient.new
    the_original_ingredient.original = params.fetch("query_original")
    the_original_ingredient.alternative = params.fetch("query_alternative")
    the_original_ingredient.sensitivity = params.fetch("query_sensitivity")
    the_original_ingredient.notes = params.fetch("query_notes")
    the_original_ingredient.type_id = params.fetch("query_type_id")

    if the_original_ingredient.valid?
      the_original_ingredient.save
      redirect_to("/original_ingredients", { :notice => "Original ingredient created successfully." })
    else
      redirect_to("/original_ingredients", { :notice => "Original ingredient failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_original_ingredient = OriginalIngredient.where({ :id => the_id }).at(0)

    the_original_ingredient.original = params.fetch("query_original")
    the_original_ingredient.alternative = params.fetch("query_alternative")
    the_original_ingredient.sensitivity = params.fetch("query_sensitivity")
    the_original_ingredient.notes = params.fetch("query_notes")
    the_original_ingredient.type_id = params.fetch("query_type_id")

    if the_original_ingredient.valid?
      the_original_ingredient.save
      redirect_to("/original_ingredients/#{the_original_ingredient.id}", { :notice => "Original ingredient updated successfully."} )
    else
      redirect_to("/original_ingredients/#{the_original_ingredient.id}", { :alert => "Original ingredient failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_original_ingredient = OriginalIngredient.where({ :id => the_id }).at(0)

    the_original_ingredient.destroy

    redirect_to("/original_ingredients", { :notice => "Original ingredient deleted successfully."} )
  end
end
