class CommentsController < ApplicationController
  def index
    matching_comments = Comment.all

    @list_of_comments = matching_comments.order({ :created_at => :desc })

    render({ :template => "comments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comments = Comment.where({ :id => the_id })

    @the_comment = matching_comments.at(0)

    render({ :template => "comments/show.html.erb" })
  end

  def create
    the_comment = Comment.new
    the_comment.body = params.fetch("query_comment")
    the_comment.commenter_id = params.fetch("user_query_id")
    the_comment.ingredient_id = params.fetch("alt_query_id")
    the_comment.save
    redirect_to("/alternatives/#{the_comment.ingredient_id}", { :notice => "Alternative updated successfully."} )

  end

  def update
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.body = params.fetch("query_body")
    the_comment.commenter_id = params.fetch("query_commenter_id")
    the_comment.ingredient_id = params.fetch("query_ingredient_id")
    the_comment.measurement_id = params.fetch("query_measurement_id")
    the_comment.dietary_id = params.fetch("query_dietary_id")

    if the_comment.valid?
      the_comment.save
      redirect_to("/comments/#{the_comment.id}", { :notice => "Comment updated successfully."} )
    else
      redirect_to("/comments/#{the_comment.id}", { :alert => "Comment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.destroy

    redirect_to("/comments", { :notice => "Comment deleted successfully."} )
  end
end
