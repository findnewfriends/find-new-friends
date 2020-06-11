class HomeController < ApplicationController
  def index 
    skip_before_action :authenticate_user!, :only => [:index]
  end
end
