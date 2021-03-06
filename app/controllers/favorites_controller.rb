class FavoritesController < ApplicationController
  def index
    user_id = session[:user_id]
    users = User.all
    @this_user = users.where({:id => user_id}).first
    matching_favorites = Favorite.all
    @list_of_favorites = matching_favorites.order({ :created_at => :desc })
    @user_faves = @list_of_favorites.where({:user_id => user_id})
    render({ :template => "favorites/index.html.erb" })
  end

  def create
    the_favorite = Favorite.new
    the_favorite.user_id = params.fetch("query_user")
    the_favorite.alternative_id = params.fetch("query_alt")
    the_favorite.save
    redirect_to("/alternatives/#{the_favorite.alternative_id}")
  end

  def update
    the_id = params.fetch("path_id")
    the_favorite = Favorite.where({ :id => the_id }).at(0)

    the_favorite.user_id = params.fetch("query_user_id")
    the_favorite.alternative_id = params.fetch("query_alternative_id")
    the_favorite.dietary_id = params.fetch("query_dietary_id")

    if the_favorite.valid?
      the_favorite.save
      redirect_to("/favorites/#{the_favorite.id}")
    else
      redirect_to("/favorites/#{the_favorite.id}", { :alert => "Favorite failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_favorite = Favorite.where({ :id => the_id }).at(0)
    alt_id = the_favorite.alternative_id
    the_favorite.destroy
    redirect_to("/alternatives/#{alt_id}")
  end
end
