class BugsController < ApplicationController
  def show
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = Bug.new
    authorize @bug
    @project = Project.find(params[:project_id])
    @user = current_user
  end

  def create
    @bug = Bug.new(bug_params)
    authorize @bug
    @project = Project.find(params[:project_id])
    @bug.user = current_user
    @bug.project = @project
    if @bug.save
      flash[:notice] = 'bug successfully created'
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def assign_bug
    @bug = Bug.find(params[:id])
    authorize @bug
    @bug.developerid = current_user.id
    if @bug.update(bug_params)
      redirect_to project_path(@bug.project)
    else
      render 'new'
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    authorize @bug
    @project = Project.find(params[:project_id])
    @bug.destroy
    redirect_to project_path(@project)
  end

  def bug_params
    params.require(:bug).permit(:title, :deadlane, :bugtype, :status, :developerid, :image)
  end
end
