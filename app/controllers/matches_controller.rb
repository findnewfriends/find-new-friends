class MatchesController < ApplicationController
  load_and_authorize_resource

  def index
    # @users = User.all
    puts "========================= PARAMS = #{params}"
    # Parameters: {"age"=>"Less than 25", "gender"=>"Female", "interest"=>"14", "city"=>"14"}

    matches = Match.all.where(user:current_user).joins(:matched_user).order(:score)
    puts "@matches.length before filtering= #{@matches.length}"

    #GENDER FILTER
    if params[:gender] && params[:gender] != ''
      matches = matches.where(users:{gender:params[:gender][0]})
    end

    #CITY FILTER
    if params[:city] && params[:city] != ''
      selected_city = params[:city].to_i
      matches = matches.where(users:{city: selected_city })
      puts "@matches.length after city filter= #{@matches.length}"
    end
    #AGE FILTER
    if params[:age] && params[:age] != ''
      case params[:age]
      when "Less than 25"
        time_range = (Time.now - 25.year)..(Time.now - 18.year)
      when "25-30"
        time_range = (Time.now - 30.year)..(Time.now - 25.year)
      when "30-35"
        time_range = (Time.now - 35.year)..(Time.now - 30.year)
      when "More than 35"
        time_range = (Time.now - 99.year)..(Time.now - 35.year)
      end
      matches = matches.where('users.birthdate' => time_range)
    end

    # if params[:interest] && params[:interest] != ''
    #   # matches = matches.where(users:{interest: params[:interest].to_i })
    #   puts "@matches.length after interest filter= #{@matches.length}"
    # end

    @matches = matches

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
        # format.html { redirect_to matches_url, notice: 'Request was sent succesfully.' }
        # format.json { render :show, status: :created, location: @match }
        format.js { puts "======== respond_to detected js format!"}
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
