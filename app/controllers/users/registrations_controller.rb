 #frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]

   #GET /resource/sign_up
   def new
    @interests = Interest.all
    super
  end

   #POST /resource
   def create
    @interests = Interest.all
    interests = params[:interests][:ids]
    interests.delete_at(0)
    if interests.length == 0
      flash[:danger] = 'You need to put 1 interest minimum'
    end
    
    if flash[:danger]
      redirect_to new_user_registration_path
    else
      super
      interests.each do |interest|
        JoinUserInterest.create(user: current_user, interest: Interest.find(interest.to_i))
      end
    end

   end

   #GET /resource/edit
   def edit
    @cities = City.all
     super
   end

   #PUT /resource
   def update
    super

    if resource.errors.empty?
      User.find(current_user.id).update(city_id: params[:user][:city].to_i )      
    end
   end

   #DELETE /resource
   def destroy
     super
   end

=begin
   GET /resource/cancel
   Forces the session data which is usually expired after sign
   in to be expired now. This is useful if the user wants to
   cancel oauth signing in/up in the middle of the process,
   removing all OAuth session data.
=end
   def cancel
     super
   end

   protected

   #If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
   end

   #If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
   end

   #The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end

   #The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end
end
