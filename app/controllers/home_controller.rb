class HomeController < ApplicationController
  
  def index
    @proposes = Vpropose.all
  end

  def policy
  end

  def privacy
  end 
end
