class MatchesController < ApplicationController
  load_and_authorize_resource 
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # rescue_from CanCan::AccessDenied do |exception|
    #   redirect_to :back, :alert => exception.message
    # end
  end

end
