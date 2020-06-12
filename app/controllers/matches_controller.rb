class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
  end
end
