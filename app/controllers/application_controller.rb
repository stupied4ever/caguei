class ApplicationController < ActionController::Base
  include Facebooker2::Rails::Controller
  protect_from_forgery
   before_filter :set_fb_session

  def set_fb_session
    session[:fb_user] = current_facebook_user.fetch if session[:fb_user].nil? and current_facebook_user
  end
end
