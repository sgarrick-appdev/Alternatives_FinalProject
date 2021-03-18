class CommentsController < ApplicationController

  def create
    the_comment = Comment.new
    the_comment.body = params.fetch("query_comment")
    the_comment.commenter_id = params.fetch("user_query_id")
    the_comment.ingredient_id = params.fetch("alt_query_id")
    the_comment.save
    redirect_to("/alternatives/#{the_comment.ingredient_id}")
  end
end