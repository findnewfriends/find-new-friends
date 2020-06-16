class InterestsController < ApplicationController
    before_action :require_login
    before_action :all_interests, only: [:new]
    
    def new
    end
    
    def index
        @interests = User.find(current_user.id).interests
    end

    def create
        interests = Interest.all
        count = 0;
        interests.each do |interest|
            if params[interest.id.to_s].present?
                JoinUserInterest.create(user: current_user, interest: Interest.find(interest.id))
                count += 1
            end
        end

        if count < 1
          flash[:danger] = 'You need to put 1 interest minimum'
          redirect_to new_interest_path
        else
            flash[:success] = 'Yours interests has been modify'
            redirect_to user_path(current_user.id)
        end
    end

    def destroy
        JoinUserInterest.find_by(user: current_user, interest: Interest.find(params[:id])).destroy
        flash[:success] = 'Yours interests has been modify'
        redirect_to user_path
    end

    private

    def require_login
        unless user_signed_in?
            flash[:danger] = 'You need to sign in before do this'
            redirect_to new_user_session_path
        end
    end
    def all_interests
        @interests = Interest.all
    end
end
