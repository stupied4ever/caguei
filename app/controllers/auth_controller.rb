class AuthController < ApplicationController
  def index
    session[:at]=nil
    redirect_to  "https://www.facebook.com/dialog/oauth?client_id=#{ENV["FACEBOOK_APP_ID"]}&redirect_uri=#{url('/auth/callback')}&scope= #{FACEBOOK_SCOPE}"
    # authenticator.authorize_url(:scope => FACEBOOK_SCOPE, :display => 'popup')
  end

  def callback
    # puts  "#{params.inspect} _---_-_----_-_-_-_-"
    @client = Mogli::Client.create_from_code_and_authenticator(params[:code], authenticator)
    session[:at] = @client.access_token
    redirect_to "/"
  end

  def close
    "<body onload='window.close();'/>"
  end  

end
