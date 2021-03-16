class OriginalIngredientsController < ApplicationController
  def index
    @list_of_types = Type.all
    @list_of_sensitivities = Sensitivity.all
    @list_of_alternatives = Alternative.all
    @ingredients = OriginalIngredient.all
    
    # type_id = params.fetch("type_ids")

    # matching_relations = Array.new
    # type_id.each do |an_id|

    #   matching_ingredients = @ingredients.where(:type_id => an_id)
    #   matching_relations.push(matching_ingredients)
    # end
    
    # @show = Array.new
    # matching_relations.each do |a_relation|
    #   
    # end

    # @selected_types = (params[:type_ids].present? ? params[:type_ids] : [])

    # filtered_ingredients = OriginalIngredient.all(:conditions => {:type_id => params[:type_ids]})

  #   if params[:search_by_type] && params[:search_by_type] != ""
  #     @ingredients = @ingredients.where("breed like ?", 
  #     "%# {params[:search_by_breed]}%")
  #   end
  #   if params[:search_by_basic] && params[:search_by_basic] != ""
  #     @kittens = @kittens.where("color like ?", 
  #     "%# {params[:search_by_basic]}%")
  #   end
  #  if params[:search_by_age] && params[:search_by_age] != ""
  #     @kittens = @kittens.where("age like ?", 
  #     "%# {params[:search_by_color]}%")
  #   end

    render({ :template => "original_ingredients/index.html.erb" })
  end

  def show
    @list_of_types = Type.all
    @list_of_sensitivities = Sensitivity.all
    @alternatives = Alternative.all
    @ingredients = OriginalIngredient.all

    the_id = params.fetch("path_id")
    matching_original_ingredients = OriginalIngredient.where({ :id => the_id })
    @the_original_ingredient = matching_original_ingredients.at(0)

    @matching_alternative_pairs =  @alternatives.where({:original_ingredient_id => the_id})
    render({ :template => "original_ingredients/show.html.erb" })
  end

  def create_page
    @list_of_types = Type.all
    @list_of_sensitivities = Sensitivity.all
    @list_of_alternatives = Alternative.all
    @ingredients = OriginalIngredient.all
    render({:template => "/alternatives/add_an_alternative.html.erb"})
  end

  def create
    @list_of_types = Type.all
    @list_of_sensitivities = Sensitivity.all
    @list_of_alternatives = Alternative.all
    @ingredients = OriginalIngredient.all
    original_name = params.fetch("query_original")
    alternative_name = params.fetch("query_alternative")
    original_type = params.fetch("query_type_id")
  
  if @ingredients.where({:original => original_name}).first ==nil
      new_ingredient_OG = OriginalIngredient.new
      new_ingredient_OG.original = original_name
      new_ingredient_OG.type_id = original_type
      new_ingredient_OG.save
    else
    @ingredient_OG = @ingredients.where({:original => original_name}).first
    end

    if @ingredients.where({:original => alternative_name}).first ==nil
      new_ingredient_alt = OriginalIngredient.new
      new_ingredient_alt.original = alternative_name
      new_ingredient_alt.type_id = original_type
      new_ingredient_alt.save
    else
      @ingredient_alt = @ingredients.where({:original => alternative_name}).first
    end

  if @list_of_alternatives.where({:original_ingredient_id => @ingredient_OG.id, :alternative_ingredient_id => @ingredient_alt.id}).first == nil
      new_alternative_pair = Alternative.new
      new_alternative_pair.original_ingredient_id = @ingredient_OG.id
      new_alternative_pair.alternative_ingredient_id = @ingredient_alt.id
      new_alternative_pair.save
      redirect_to("/original_ingredients/#{new_alternative_pair.original_ingredient_id}", { :notice => "Original ingredient created successfully." })
  else
    redirect_to("/original_ingredients/#{@ingredient_OG.id}", { :alert => "Original ingredient already exists."})
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
