class ProjectsController < ApplicationController
  def index
    @projects = current_user.try(:developer?) ? policy_scope(ProjectUser) : policy_scope(Project)
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.managerid = current_user.id
    authorize @project
    if @project.save
      flash[:notice] = 'project successfully created'
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:name, :managerid)
  end
end
