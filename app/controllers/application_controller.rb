FACEBOOK_SCOPE = 'publish_stream,read_stream,user_likes,user_photos,user_photo_video_tags'

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_env_keys, :set_current_user



  private
  def set_current_user
    @client = Mogli::Client.new(session[:at]) if session[:at]
    @current_user = Mogli::User.find("me", @client) if @client
  end
  
  def check_env_keys
    unless ENV["FACEBOOK_APP_ID"] && ENV["FACEBOOK_SECRET"]
      abort("missing env vars: please set FACEBOOK_APP_ID and FACEBOOK_SECRET with your app credentials")
    end
  end
  
  def require_fb_auth
    redirect_to "/auth/index" unless session[:at]
  end
  
  def authenticator
    @authenticator ||= Mogli::Authenticator.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"], url("/auth/callback"))
  end
  
  def url(path)
    base = "#{request.scheme}://#{request.env['HTTP_HOST']}"
    base + path
  end
end
