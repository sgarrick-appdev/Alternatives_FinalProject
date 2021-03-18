class SensitivitiesController < ApplicationController
  # def index
  #   matching_sensitivities = Sensitivity.all

  #   @list_of_sensitivities = matching_sensitivities.order({ :created_at => :desc })

  #   render({ :template => "sensitivities/index.html.erb" })
  # end

  # def show
  #   the_id = params.fetch("path_id")

  #   matching_sensitivities = Sensitivity.where({ :id => the_id })

  #   @the_sensitivity = matching_sensitivities.at(0)

  #   render({ :template => "sensitivities/show.html.erb" })
  # end

  # def create
  #   the_sensitivity = Sensitivity.new
  #   the_sensitivity.name = params.fetch("query_name")

  #   if the_sensitivity.valid?
  #     the_sensitivity.save
  #     redirect_to("/sensitivities", { :notice => "Sensitivity created successfully." })
  #   else
  #     redirect_to("/sensitivities", { :notice => "Sensitivity failed to create successfully." })
  #   end
  # end

  # def update
  #   the_id = params.fetch("path_id")
  #   the_sensitivity = Sensitivity.where({ :id => the_id }).at(0)

  #   the_sensitivity.name = params.fetch("query_name")

  #   if the_sensitivity.valid?
  #     the_sensitivity.save
  #     redirect_to("/sensitivities/#{the_sensitivity.id}", { :notice => "Sensitivity updated successfully."} )
  #   else
  #     redirect_to("/sensitivities/#{the_sensitivity.id}", { :alert => "Sensitivity failed to update successfully." })
  #   end
  # end

  # def destroy
  #   the_id = params.fetch("path_id")
  #   the_sensitivity = Sensitivity.where({ :id => the_id }).at(0)

  #   the_sensitivity.destroy

  #   redirect_to("/sensitivities", { :notice => "Sensitivity deleted successfully."} )
  # end
end
