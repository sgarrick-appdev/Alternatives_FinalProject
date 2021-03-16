class AlternativesController < ApplicationController
  def index
    matching_alternatives = Alternative.all

    @list_of_alternatives = matching_alternatives.order({ :created_at => :desc })

    render({ :template => "alternatives/index.html.erb" })
  end

  def show
    ingredients = OriginalIngredient.all
    the_id = params.fetch("path_id")
    matching_alternatives = Alternative.where({ :id => the_id })
    @the_alternative = matching_alternatives.at(0)
    alt_id = @the_alternative.alternative_ingredient_id
    original_id = @the_alternative.original_ingredient_id
    matching_ingredient_alt = ingredients.where({:id => alt_id}).first
    @alternative_name = matching_ingredient_alt.original
    matching_ingredient_OG = ingredients.where({:id => original_id}).first
    @original_name = matching_ingredient_OG.original
    @user_id = session[:user_id]
    @matching_comments = Comment.all.where({:ingredient_id => the_id})
    @matching_favorite = Favorite.all.where({:user_id => @user_id, :alternative_id => the_id}).first
    render({ :template => "alternatives/show.html.erb" })
  end

  def create
    @list_of_alternatives = Alternative.all
    @ingredients = OriginalIngredient.all
    #get params
    original_name = params.fetch("query_original")
    @ingredient_OG = @ingredients.where({:id => original_name}).first
    alternative_name = params.fetch("query_alternative")
    original_type = params.fetch("query_type_id")
    notes = params.fetch("query_notes")
    user_id = params.fetch("user_id_query")

    #does the alternative ingredient already exist?
    new_ingredient_alt = OriginalIngredient.new
    new_ingredient_alt.original = alternative_name.downcase
    new_ingredient_alt.type_id = original_type
    if new_ingredient_alt.valid? #if it doesn't already exist, make a new alternative pair
      new_ingredient_alt.save
      if @list_of_alternatives.where({:original_ingredient_id => @ingredient_OG.id, :alternative_ingredient_id => new_ingredient_alt.id}).first == nil
      new_alternative_pair = Alternative.new
      new_alternative_pair.original_ingredient_id = @ingredient_OG.id
      new_alternative_pair.alternative_ingredient_id = new_ingredient_alt.id
      new_alternative_pair.user_id = user_id
      new_alternative_pair.save
      redirect_to("/original_ingredients/#{new_alternative_pair.original_ingredient_id}", { :notice => "Original ingredient created successfully."})
      end
    else #does already exist - but does the alternative pair already exist?
      @ingredient_alt = @ingredients.where({:original => alternative_name}).first
      if @list_of_alternatives.where({:original_ingredient_id => @ingredient_OG.id, :alternative_ingredient_id => @ingredient_alt.id}).first == nil #if it doesn't already exist - add a new pair!
      new_alternative_pair = Alternative.new
      new_alternative_pair.original_ingredient_id = @ingredient_OG.id
      new_alternative_pair.alternative_ingredient_id = @ingredient_alt.id
      new_alternative_pair.user_id = user_id
      new_alternative_pair.save
      redirect_to("/original_ingredients/#{new_alternative_pair.original_ingredient_id}", { :notice => "Original ingredient pair created successfully." })
      else
        redirect_to("/original_ingredients/#{@ingredient_OG.id}", { :alert => "Original ingredient pair exists."})
      end
    end
    
  end

  # def update
  #   the_id = params.fetch("path_id")
  #   the_alternative = Alternative.where({ :id => the_id }).at(0)

  #   the_alternative.original_ingredient_id = params.fetch("query_original_ingredient_id")
  #   the_alternative.alternative_ingredient_id = params.fetch("query_alternative_ingredient_id")

  #   if the_alternative.valid?
  #     the_alternative.save
  #     redirect_to("/alternatives/#{the_alternative.id}", { :notice => "Alternative updated successfully."} )
  #   else
  #     redirect_to("/alternatives/#{the_alternative.id}", { :alert => "Alternative failed to update successfully." })
  #   end
  # end

  def destroy
    the_id = params.fetch("path_id")
    the_alternative = Alternative.where({ :id => the_id }).at(0)
    the_alternative.destroy
    original_ingredient = the_alternative.original_ingredient_id
    redirect_to("/original_ingredients/#{original_ingredient}", { :notice => "Alternative pair deleted successfully."} )
  end
end
