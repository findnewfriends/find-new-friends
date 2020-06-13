class MatchesController < ApplicationController
  load_and_authorize_resource

  def index
    @matches = Match.all.where(user:current_user).or(Match.all.where(matched_user:current_user)).order(:score)
  end

  def show
    @user = User.find(params[:id])
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to :back, :alert => exception.message
    end
  end

end
