class UsersController < ApplicationController
  before_action :current_user
  before_action :user_authorized

  def new
  end

  def show
    @user=User.find(current_user)
    @projects=@user.projects
  end

  def index
    @users=User.all

  end

  def edit
    @user=User.find(current_user)
  end

  def update
    @user=User.find(session[:user_id])
    @user.update(user_params)
    redirect_to projects_path
  end
  def destroy
      User.find(current_user).destroy
      reset_session
      flash[:success] = "User deleted"
      redirect_to :root
  end

    private
    def user_params
      params.require(:user).permit(:name, :email, :github, :image)
    end


end
