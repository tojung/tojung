ActiveAdmin.register Package do
  # belongs_to :product
  # belongs_to :product
  #  navigation_menu :product
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # belongs_to :product
  # has_many :product_options
  # navigation_menu :product

  permit_params :product_id, :name, :content, :price, :image0, :remain_count
  #
  # or
  index do
    selectable_column
    column "My Custom Title", :name
    column "remain_count", :remain_count

  end
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form title: '패키지 추가/수정 하기' do |f|
    input 'product'
    # input 'product_option_ids', as: :check_boxes, collection: ProductOption.all
    input 'name'
    # input 'product_options', as: :check_boxes
    input 'remain_count'
    input 'content'
    input 'price'
    actions
  end
end
