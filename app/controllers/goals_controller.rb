class GoalsController < ApplicationController

  before_action :ensure_login

  def new
    #code
    @goal = Goal.new
    render :new
  end

  def edit
    #code
    @goal = Goal.find_by_id(params[:id])
    render :edit
  end

  def create
    #code
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def update
    @goal = Goal.find_by_id(params[:id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def index
    @goals = Goal.all.sort_by { |goal| goal.cheer_count }.reverse
  end

  def show
    @goal = Goal.find_by_id(params[:id])
    render :show
  end

  def destroy
    @goal = Goal.find_by_id(params[:id])
    Goal.destroy(@goal)
    redirect_to user_url(current_user)
  end
  private

  def goal_params
    params.require(:goal).permit(:body, :completed, :private)
  end

end
