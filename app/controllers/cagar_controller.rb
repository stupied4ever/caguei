require 'net/https'
require 'open-uri'

class CagarController < ApplicationController
  def caguei
    # send_caguei_comment("Cagou para isso")
    creat_a_new_post_to_my_feed("Caguei muito para o post do Navarro", "caguei", "http://www.facebook.com/vitor.navarro", "Uma demonstracao de indiferenca para o post do navarro","http://lh3.ggpht.com/-Ol2ggZhgLL8/Sld22kHpItI/AAAAAAAAAGc/mY0eXbAlrAY/caguei.JPG" )
  end
  
  
end
