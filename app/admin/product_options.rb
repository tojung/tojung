ActiveAdmin.register ProductOption do

  permit_params :name, :product_id, :content, :price, :status, :image0, :image1

  menu label: '제품'
  scope :all, default: true
  Product.all.each do |product|
    scope product.name do |product_options|
      product_options.where(product_id: product.id)
    end
  end

  index do
    selectable_column
    column '제품이름' do |product_option|
      link_to product_option.name, admin_product_option_path(product_option)
    end
    column '제품설명', :content
    column '남은제품수', :remain_count
    column '가격', :price
  end
  # controller do
  #   def create
  #     super
  #     Maker.create(name: 'f')
  #   end
  # end
  #
  # member_action :create_op, :method => :post do
  #   puts("********************")
  #   print(params[:price])
  #   puts("********************")
  #   Maker.create()
  # end
  # index as: :block do |product|
  #   div for: product do
  #     resource_selection_cell product
  #     h2  auto_link     product.name
  #     div simple_format product.content
  #   end
  # end
  # index as: :grid do |product|
  #   div do
  #     a href: admin_product_path(product) do
  #       image_tag(product.image0, style: "width: 40%;")
  #     end
  #   end
  #   a truncate(product.name), href: admin_product_path(product)
  # end
end
