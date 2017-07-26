class ProjectsController < ApplicationController
  before_action :user_authorized

  def new
    @project=Project.new
  end


  def index

  end


  def edit

  end

  def update

  end

  def destroy

  end
end
