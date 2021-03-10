class ExperiencesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end 

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @experience.destroy
    redirect_to root_path
  end

  def update
    if @experience.update(experience_params)
      redirect_to root_path
    else
      render :edit
    end
  end



  private
  def experience_params
    params.require(:experience).permit(:title, :content, :price).merge(user_id: current_user.id)
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def move_to_index
    unless current_user == @experience.user
      redirect_to action: :index
    end
  end
  
end
