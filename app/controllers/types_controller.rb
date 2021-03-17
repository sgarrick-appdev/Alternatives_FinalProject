class TypesController < ApplicationController
  # def index
  #   matching_types = Type.all

  #   @list_of_types = matching_types.order({ :created_at => :desc })

  #   render({ :template => "types/index.html.erb" })
  # end

  # def show
  #   the_id = params.fetch("path_id")

  #   matching_types = Type.where({ :id => the_id })

  #   @the_type = matching_types.at(0)

  #   render({ :template => "types/show.html.erb" })
  # end

  # def create
  #   the_type = Type.new
  #   the_type.name = params.fetch("query_name")

  #   if the_type.valid?
  #     the_type.save
  #     redirect_to("/types", { :notice => "Type created successfully." })
  #   else
  #     redirect_to("/types", { :notice => "Type failed to create successfully." })
  #   end
  # end

  # def update
  #   the_id = params.fetch("path_id")
  #   the_type = Type.where({ :id => the_id }).at(0)

  #   the_type.name = params.fetch("query_name")

  #   if the_type.valid?
  #     the_type.save
  #     redirect_to("/types/#{the_type.id}", { :notice => "Type updated successfully."} )
  #   else
  #     redirect_to("/types/#{the_type.id}", { :alert => "Type failed to update successfully." })
  #   end
  # end

  # def destroy
  #   the_id = params.fetch("path_id")
  #   the_type = Type.where({ :id => the_id }).at(0)

  #   the_type.destroy

  #   redirect_to("/types", { :notice => "Type deleted successfully."} )
  # end
end
