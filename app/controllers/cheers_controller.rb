class CheersController < ApplicationController

  before_action :ensure_login

  def create
    @cheer = Cheer.new(cheer_params)
    flash[:errors] ||= []
    user_cheers = current_user.cheers.map { |cheer| cheer.goal_id }
    unless user_cheers.include?(cheer_params[:goal_id].to_i)
      @cheer.cheerer_id = current_user.id
      @cheer.save
    else
      flash[:errors] << "You already cheered this goal"
    end
    
    flash[:errors] += @cheer.errors.full_messages
    redirect_to goal_url(@cheer.goal)
  end

  private

  def cheer_params
    params.require(:cheer).permit(:goal_id)
  end
end
