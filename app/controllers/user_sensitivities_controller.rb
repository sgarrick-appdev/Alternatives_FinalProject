class UserSensitivitiesController < ApplicationController
  def index
    matching_user_sensitivities = UserSensitivity.all

    @list_of_user_sensitivities = matching_user_sensitivities.order({ :created_at => :desc })

    render({ :template => "user_sensitivities/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_sensitivities = UserSensitivity.where({ :id => the_id })

    @the_user_sensitivity = matching_user_sensitivities.at(0)

    render({ :template => "user_sensitivities/show.html.erb" })
  end

  def create
    the_user_sensitivity = UserSensitivity.new
    the_user_sensitivity.user_id = params.fetch("query_user_id")
    the_user_sensitivity.sensitivity_id = params.fetch("query_sensitivity_id")

    if the_user_sensitivity.valid?
      the_user_sensitivity.save
      redirect_to("/user_sensitivities", { :notice => "User sensitivity created successfully." })
    else
      redirect_to("/user_sensitivities", { :notice => "User sensitivity failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_sensitivity = UserSensitivity.where({ :id => the_id }).at(0)

    the_user_sensitivity.user_id = params.fetch("query_user_id")
    the_user_sensitivity.sensitivity_id = params.fetch("query_sensitivity_id")

    if the_user_sensitivity.valid?
      the_user_sensitivity.save
      redirect_to("/user_sensitivities/#{the_user_sensitivity.id}", { :notice => "User sensitivity updated successfully."} )
    else
      redirect_to("/user_sensitivities/#{the_user_sensitivity.id}", { :alert => "User sensitivity failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_sensitivity = UserSensitivity.where({ :id => the_id }).at(0)

    the_user_sensitivity.destroy

    redirect_to("/user_sensitivities", { :notice => "User sensitivity deleted successfully."} )
  end
end
