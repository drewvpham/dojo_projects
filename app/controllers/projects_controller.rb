class ProjectsController < ApplicationController
  before_action :user_authorized

  def new
    @project=Project.new
  end

  def show
    @project=Project.find(params[:id])
    @user=@project.user
  end

  def create
    @user=User.find(current_user)
    @project = Project.create(project_params.merge(user:@user))
    if @project.valid?
      redirect_to projects_path
    else
      flash[:errors]=@project.errors.full_messages
    end
  end


  def index
    @projects=Project.order(created_at: :desc).page(params[:page])
  end
  end


  def edit
    @project=Project.find(params[:id])
  end

  def update
    @project=Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end



  def destroy
    @project=Project.find(params[:id])
    @user=current_user
      if @project.user==@user
      @project.destroy
      flash[:deleted] = "Project deleted"
      redirect_to projects_path
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :github, :youtube, :url, :description)
  end
end
