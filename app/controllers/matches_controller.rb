class MatchesController < ApplicationController
  load_and_authorize_resource

  def index
    # @users = User.all
    @matches = @matches.none
    puts "========================= PARAMS = #{params}"
    puts "========================= PARAMS = #{params}"
    puts "========================= PARAMS = #{params}"
    puts "========================= PARAMS = #{params}"
    puts "========================= PARAMS = #{params}"
    puts "========================= PARAMS = #{params}"
    puts "========================= PARAMS = #{params}"
    puts "========================= PARAMS = #{params}"
    puts "========================= PARAMS = #{params}"
    matches = Match.all.where(user:current_user).or(Match.all.where(matched_user:current_user)).order(:score)
    puts "@matches.length before filtering= #{matches.length}"
    if params[:gender] == 'Male'
      gender_col_1 = matches.joins(:matched_user).where(user:current_user).where(users:{gender:'M'})
      gender_col_2 = matches.joins(:user).where(matched_user:current_user).where(users:{gender:'M'})
      @matches = gender_col_1 | gender_col_2
      puts "@matches.length male= #{@matches.length}"
    elsif params[:gender] == 'Female'
      gender_col_1 = matches.joins(:matched_user).where(user:current_user).where(users:{gender:'F'})
      gender_col_2 = matches.joins(:user).where(matched_user:current_user).where(users:{gender:'F'})
      @matches = gender_col_1 | gender_col_2
      puts "@matches.length female= #{@matches.length}"
    elsif params[:gender] == 'Other'
      gender_col_1 = matches.joins(:matched_user).where(user:current_user).where(users:{gender:'O'})
      gender_col_2 = matches.joins(:user).where(matched_user:current_user).where(users:{gender:'O'})
      @matches = gender_col_1 | gender_col_2
      puts "@matches.length other= #{@matches.length}"
    else
      @matches = matches
      puts "\n\n\n\n@matches.length all = #{@matches.length}\n\n\n\n"
    end

    # Parameters: {"age"=>"Less than 25", "gender"=>"Female", "interest"=>"14", "city"=>"14"}



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
