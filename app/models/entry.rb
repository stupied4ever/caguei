# encoding: UTF-8
class Entry < ActiveRecord::Base
  validates_presence_of :to_id, :user_name, :user_to_id
  after_save :send_caguei_comment, :creat_a_new_post_to_my_feed
  attr_accessor :access_token
  
  def send_caguei_comment
    data = { :access_token => self.access_token, :message => "cagou para isso." }
    # self.to_id = "1560140991_272127756151837"
    url = URI.parse("https://graph.facebook.com/#{self.to_id}/comments"  )
    req = Net::HTTP::Post.new(url.path)
    req.form_data = data

    con = Net::HTTP.new(url.host, url.port)
    con.use_ssl = true
    con.start {|http| http.request(req)}
  end
  
  def creat_a_new_post_to_my_feed
    link = "url.do.caguei"
    description = "Uma demonstração de indiferença para o post de #{self.user_name}"
    picture = "http://lh3.ggpht.com/-Ol2ggZhgLL8/Sld22kHpItI/AAAAAAAAAGc/mY0eXbAlrAY/caguei.JPG"
    data = { :access_token => self.access_token, :message => "Caguei muito para o post de #{self.user_name}", :name => self.user_name, :link => link, :description => description, :picture => picture }
  
  puts "https://graph.facebook.com/#{self.user_from_id}/feed"
    url = URI.parse("https://graph.facebook.com/#{self.user_from_id}/feed"  )
    req = Net::HTTP::Post.new(url.path)
    req.form_data = data

    con = Net::HTTP.new(url.host, url.port)
    con.use_ssl = true
    con.start {|http| http.request(req)}
  end

end
