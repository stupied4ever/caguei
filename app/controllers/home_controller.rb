class HomeController < ApplicationController
  before_filter :require_fb_auth
  
  def index
    @home_posts = @current_user.home.select{ |p| p.message.blank? == false }
  end
end
