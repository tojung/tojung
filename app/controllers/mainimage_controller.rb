class MainimageController < ApplicationController
  before_action :redirect_root_without_admin
  after_action :redirect_root, only: %i[create]
  # GET 'mainimage/new'
  def new; end

  # POST 'mainimage/create'
  def create
    mainimage = Mainimage.new
    mainimage.createNew(mainimage_params)
    redis_set_mainimage(mainimage)
  end

  private

  def mainimage_params
    params.permit(:ver_name, :image0, :image1, :image2)
  end

  # noinspection RubyResolve
  def redis_set_mainimage(mainimage)
    $redis.set('mainimage0', @cdn_url + mainimage.image0.path)
    $redis.set('mainimage1', @cdn_url + mainimage.image1.path)
    $redis.set('mainimage2', @cdn_url + mainimage.image2.path)
  end
end
