class ProjectUsersController < ApplicationController
  def new
    @project = Project.find(params[:id])
    authorize @project, policy_class: ProjectUserPolicy
    @user = @project.users.build
  end

  def create
    @project = Project.find(params[:id])
    authorize @project, policy_class: ProjectUserPolicy
    email = params[:user][:email]
    u = User.find_by(email: email)
    if u
      if u.user_type == 'developer' || u.user_type == 'qa'
        if @project.users << u
          redirect_to project_path
        else
          render 'new'
        end
      else
        flash[:notice] = 'Manager cannot be added'
        @user = @project.users.build
        render 'new'
      end
    else
      flash.now[:notice] = 'User does not exist'
      @user = @project.users.build
      render 'new'
    end
  end

  def destroy
    @p = ProjectUser.find(params[:id])
    authorize @project, policy_class: ProjectUserPolicy
    @p.destroy
    redirect_to projects_path
  end
end
