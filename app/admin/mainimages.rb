ActiveAdmin.register Mainimage do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :image0, :image1, :image2
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  controller do
    def create
      super
      m = Mainimage.last
      cdn_url = 'https://d1eq7v76s8dt2n.cloudfront.net/'
      puts "*******"
      puts m.image0
      $redis.set('mainimage0', cdn_url + m.image0.path)
      $redis.set('mainimage1', cdn_url + m.image1.path)
      $redis.set('mainimage2', cdn_url + m.image2.path)
    end
  end
end
