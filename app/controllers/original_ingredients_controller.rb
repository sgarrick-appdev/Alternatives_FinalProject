class OriginalIngredientsController < ApplicationController
  def index
    @list_of_types = Type.all
    @list_of_sensitivities = Sensitivity.all
    @list_of_alternatives = Alternative.all
    @ingredients = OriginalIngredient.all
    @user_id = session[:user_id]

    @q = @ingredients.ransack(params[:q])
    @matching_ingredients = @q.result(:distinct => true).includes(:type)

    @check_presence = @matching_ingredients.first
    render({ :template => "original_ingredients/index.html.erb" })
  
  
  end

  def show
    @list_of_types = Type.all
    @list_of_sensitivities = Sensitivity.all
    @alternatives = Alternative.all
    @ingredients = OriginalIngredient.all
    @food_sensitivities = FoodSensitivity.all

    the_id = params.fetch("path_id")
    matching_original_ingredients = OriginalIngredient.where({ :id => the_id })
    @the_original_ingredient = matching_original_ingredients.at(0)

    @matching_alternative_pairs =  @alternatives.where({:original_ingredient_id => the_id})
    @user_id = session[:user_id]
    render({ :template => "original_ingredients/show.html.erb" })
  end

  def create_page
    @list_of_types = Type.all
    @list_of_sensitivities = Sensitivity.all
    @list_of_alternatives = Alternative.all
    @ingredients = OriginalIngredient.all
    @user_id = session[:user_id]
    render({:template => "/alternatives/add_an_alternative.html.erb"})
  end

  def create
    @list_of_types = Type.all
    @list_of_sensitivities = Sensitivity.all
    @list_of_alternatives = Alternative.all
    @ingredients = OriginalIngredient.all
    @user_id = session[:user_id]
    original_name = params.fetch("query_original")
    alternative_name = params.fetch("query_alternative")
    original_type = params.fetch("query_type_id")
    user_id = params.fetch("user_id_query")
    @sensitivity_ids = params.fetch("sensitivity_id")
    if @sensitivity_ids.blank?
      redirect_to("/create_new_alternative", { :alert => "Must add sensitivity field"})
    else
    notes = params.fetch("query_notes")
    new_ingredient_OG = OriginalIngredient.new
    new_ingredient_OG.original = original_name.downcase
    new_ingredient_OG.type_id = original_type
    if new_ingredient_OG.valid?
      new_ingredient_OG.save
    else
      new_ingredient_OG = @ingredients.where({:original => original_name.downcase}).first
    end

    new_ingredient_alt = OriginalIngredient.new
    new_ingredient_alt.original = alternative_name.downcase
    new_ingredient_alt.type_id = original_type
    if new_ingredient_alt.valid?
      new_ingredient_alt.save
    else
      new_ingredient_alt = @ingredients.where({:original => alternative_name.downcase}).first
    end
      @sensitivity_ids.each do |an_id|
      int_id = an_id.to_i
      new_food_sensitivity = FoodSensitivity.new
      new_food_sensitivity.ingredient_id = new_ingredient_alt.id
      new_food_sensitivity.sensitivity_id = int_id
        if new_food_sensitivity.valid?
          new_food_sensitivity.save
        end

      end
    if @list_of_alternatives.where({:alternative_ingredient_id =>new_ingredient_alt.id,:original_ingredient_id =>new_ingredient_OG.id }).first==nil
      new_alternative_pair = Alternative.new
      new_alternative_pair.original_ingredient_id = new_ingredient_OG.id
      new_alternative_pair.alternative_ingredient_id = new_ingredient_alt.id
      new_alternative_pair.notes = notes
      new_alternative_pair.user_id = user_id
      new_alternative_pair.save
      redirect_to("/original_ingredients/#{new_alternative_pair.original_ingredient_id}", { :notice => "Alternative pair created successfully." })
    else
    redirect_to("/original_ingredients/#{new_ingredient_OG.id}", { :alert => "Alternative pair already exists."})
  end

  end
end
end
