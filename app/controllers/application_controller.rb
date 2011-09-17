class ApplicationController < ActionController::Base
  include Facebooker2::Rails::Controller
  protect_from_forgery
  before_filter :set_fb_session

  def set_fb_session
        if session[:fb_user].nil? and current_facebook_user
          begin
              session[:fb_user] = current_facebook_user.fetch
          rescue Exception => e
              current_facebook_user = nil
          end
        elsif not current_facebook_user.inspect
            session[:fb_user] = nil
        end
      end
    end

end
