class FoodSensitivitiesController < ApplicationController
  def index
    matching_food_sensitivities = FoodSensitivity.all

    @list_of_food_sensitivities = matching_food_sensitivities.order({ :created_at => :desc })

    render({ :template => "food_sensitivities/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_food_sensitivities = FoodSensitivity.where({ :id => the_id })

    @the_food_sensitivity = matching_food_sensitivities.at(0)

    render({ :template => "food_sensitivities/show.html.erb" })
  end

  def create
    the_food_sensitivity = FoodSensitivity.new
    the_food_sensitivity.ingredient_id = params.fetch("query_ingredient_id")
    the_food_sensitivity.sensitivity_id = params.fetch("query_sensitivity_id")
    the_food_sensitivity.dietary_id = params.fetch("query_dietary_id")

    if the_food_sensitivity.valid?
      the_food_sensitivity.save
      redirect_to("/food_sensitivities", { :notice => "Food sensitivity created successfully." })
    else
      redirect_to("/food_sensitivities", { :notice => "Food sensitivity failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_food_sensitivity = FoodSensitivity.where({ :id => the_id }).at(0)

    the_food_sensitivity.ingredient_id = params.fetch("query_ingredient_id")
    the_food_sensitivity.sensitivity_id = params.fetch("query_sensitivity_id")
    the_food_sensitivity.dietary_id = params.fetch("query_dietary_id")

    if the_food_sensitivity.valid?
      the_food_sensitivity.save
      redirect_to("/food_sensitivities/#{the_food_sensitivity.id}", { :notice => "Food sensitivity updated successfully."} )
    else
      redirect_to("/food_sensitivities/#{the_food_sensitivity.id}", { :alert => "Food sensitivity failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_food_sensitivity = FoodSensitivity.where({ :id => the_id }).at(0)

    the_food_sensitivity.destroy

    redirect_to("/food_sensitivities", { :notice => "Food sensitivity deleted successfully."} )
  end
end
