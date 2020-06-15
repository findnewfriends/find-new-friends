class MatchesController < ApplicationController
  load_and_authorize_resource

  def index
    # @users = User.all
    @matches = Match.all.where(user:current_user).or(Match.all.where(matched_user:current_user)).order(:score)
  end

  def show
    @user = User.find(params[:id])
    # rescue_from CanCan::AccessDenied do |exception|
    #   redirect_to :back, :alert => exception.message
    # end
  end


  def update
    puts "---------------------------------------------o-o-o-o-o---o-o-o-o-o- params are #{params}"
    puts "---------------------------------------------o-o-o-o-o---o-o-o-o-o- match_params are #{match_params}"
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to matches_url, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # # Use callbacks to share common setup or constraints between actions.
  # def set_match
  #   @match = Match.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
    def match_params
      puts "Entered match_params method"
      puts "---------------------------------------------o-o-o-o-o---o-o-o-o-o- params are #{params}"
      match_params = params.require(:match).permit(:user, :matched_user, :status)
      match_params[:user] = User.find(match_params[:user].to_i)
      match_params[:matched_user] = User.find(match_params[:matched_user].to_i)
      return match_params
    end


end
