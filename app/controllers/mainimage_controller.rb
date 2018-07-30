class MainimageController < ApplicationController
  before_action :check_admin

  # GET 'mainimage/new'
  def new; end

  # POST 'mainimage/create'
  def create
    cdn_url = "http://d1eq7v76s8dt2n.cloudfront.net/"
    mainimage = Mainimage.new
    mainimage.createNew(mainimage_params)

    $redis.set('mainimage0', cdn_url + mainimage.image0.path)
    $redis.set('mainimage1', cdn_url + mainimage.image1.path)
    $redis.set('mainimage2', cdn_url + mainimage.image2.path)

    redirect_to '/'
  end

  private

  def check_admin
    redirect_to '/' if !(user_signed_in?) or !(current_user.admin)
  end

  def mainimage_params
    params.permit(:ver_name, :image0, :image1, :image2)
  end
end
