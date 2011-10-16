require 'net/https'
require 'open-uri'

class CagarController < ApplicationController
  def caguei
    # send_caguei_comment("Cagou para isso")
    creat_a_new_post_to_my_feed("Caguei muito para o post do Navarro", "caguei", "http://www.facebook.com/vitor.navarro", "Uma demonstracao de indiferenca para o post do navarro","http://lh3.ggpht.com/-Ol2ggZhgLL8/Sld22kHpItI/AAAAAAAAAGc/mY0eXbAlrAY/caguei.JPG" )
  end
  
  
  private
  def send_caguei_comment(message)
    data = { :access_token => @client.access_token, :message => message }
  
    url = URI.parse("https://graph.facebook.com/1560140991_272127756151837/comments"  )
    req = Net::HTTP::Post.new(url.path)
    req.form_data = data

    con = Net::HTTP.new(url.host, url.port)
    con.use_ssl = true
    con.start {|http| http.request(req)}    
  end
  
  def creat_a_new_post_to_my_feed(message, name, link, description, picture)
    data = { :access_token => @client.access_token, :message => message, :name => name, :link => link, :description => description, :picture => picture, :to => [{:name => "Vitor Navarro", :id => "1560140991"}] }
  
    url = URI.parse("https://graph.facebook.com/#{@current_user.id}/feed"  )
    req = Net::HTTP::Post.new(url.path)
    req.form_data = data

    con = Net::HTTP.new(url.host, url.port)
    con.use_ssl = true
    con.start {|http| http.request(req)}
  end
end
