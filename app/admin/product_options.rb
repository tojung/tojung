ActiveAdmin.register ProductOption do
  permit_params :name, :product_id, :content, :price, :status, :image0, :image1

  menu label: '제품'
  scope :all, default: true
  Product.all.each do |product|
    scope product.name do |_product_options|
      product.product_options
    end
  end

  index do
    selectable_column
    column '법안상품', :product
    column '제품이름' do |product_option|
      link_to product_option.name, admin_product_option_path(product_option)
    end
    column '이미지', :image0 do |pr|
      image_tag pr.image0, style: 'width: 30%'
    end
    column '제품설명', :content
    column '남은제품수', :remain_count
    column '판매량', :selled_count
    column '가격', :price
  end
end
