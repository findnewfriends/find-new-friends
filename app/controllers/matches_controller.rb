class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create

  end

end
