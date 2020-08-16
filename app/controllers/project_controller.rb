class ProjectController < ApplicationController
  before_action :authenticate_user!, only: [:list]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks.order(:tag)

    #validate access to project with subscription
    @joined = false

    if !current_user.nil? && !current_user.projects.nil?
      @joined = current_user.projects.include?(@project)
    end
  end

  #myproject list
  def list
    if !current_user.nil?
      @projects = current_user.projects
    end
  end

end
