class TaskController < ApplicationController
  before_action :authenticate_user!

  def show
    project = Project.find(params[:project_id])
    @tasks = project.tasks.order(:tag)
    @task = @tasks.find(params[:id])

    #validate access to project with subscription
    joined = false

    if !current_user.nil? && !current_user.projects.nil?
      joined = current_user.projects.include?(project)
    end

    #next and prev buttons  before buy the project
    if joined
      @task = @tasks.find(params[:id])
      @next_task = @task.next
      @prev_task = @task.prev
    else
      flash[:alert] = "You don't have permission for this project!"
      redirect_to project
    end
    
  end
end
