class MatchesController < ApplicationController
  load_and_authorize_resource 
  def index
    @matches = Match.all
  end

  def show
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to :back, :alert => exception.message
    end
  end

  
end
