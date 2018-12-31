ActiveAdmin.register ProductCaroImage do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :image, :product_id, :num
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form title: '캐로우젤' do |_f|
    input 'product', label: '법안 상품'
    input 'image', label: '이미지'
    input 'num', label: '순서'
    actions
  end

end
