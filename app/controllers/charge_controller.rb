class ChargeController < ApplicationController
    before_action :authenticate_user!
    #free subscription
    def free
        project = Project.find(params[:project_id])
        current_user.subscriptions.create(project: project)

        redirect_to project
    end
end