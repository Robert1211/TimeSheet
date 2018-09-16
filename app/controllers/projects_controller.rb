class ProjectsController < ApplicationController
  def index
    @projects = @current_user.projects
  end

  def show
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new
    project.name = params[:project][:name]
    project.description = params[:project][:description]
    project.save
    @current_user.projects << project
    redirect_to new_job_path
  end

  def edit
  end

  def destroy
    project = Project.find params[:id]
    project.destroy
    redirect_to projects_path
  end
end
