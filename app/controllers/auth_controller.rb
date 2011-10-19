class AuthController < ApplicationController
  def index
    @url_call_back = url('/auth/callback')
    puts "URL => #{ authenticator.authorize_url(:scope => FACEBOOK_SCOPE, :display => 'page')}"
    session[:at]=nil
    redirect_to authenticator.authorize_url(:scope => FACEBOOK_SCOPE, :display => 'page')
  end

  def callback
    # puts  "#{params[:code]} _---_-_----_-_-_-_-"
    # 
    @client = Mogli::Client.create_from_code_and_authenticator(params[:code], authenticator)
    session[:at] = @client.access_token
    redirect_to "/"
  end

  def close
    "<body onload='window.close();'/>"
  end  

end
