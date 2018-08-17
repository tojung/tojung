ActiveAdmin.register Package do
  menu label: '패키지'
  permit_params :product_id, :name, :content, :price, :image0, :remain_count, :product_option_ids

  scope :all, default: true
  Package.all.each do |package|
    next if package.product.nil?
    scope package.product.name do
      Package.where(product_id: package.product.id)
    end
  end

  index do
    selectable_column
    column '법안 상품', :product
    column '패키지 이름' do |package|
      link_to package.name, admin_package_path(package)
    end
    column '판매량', :selled_count
    column '재고', :remain_count
    column '패키지 설명', :content
    column '이미지' do |package|
      image_tag(package.image0, style: 'width: 30%;')
    end
  end

  show do
    table_for package i18n: Package do
      column :id
      column '법안상품', :product
      column '패키지이름', :name
      column '패키지설명', :content
      column '재고', :remain_count
      column '판매량', :selled_count
      column '이미지' do |package|
        image_tag package.image0, style: 'width: 30%;'
      end
    end

    panel '패키지내 제품들' do
      table_for package.product_options do
        column '제품이름', :name
        column '제품설명', :content
        column '제품이미지', :image0 do |im|
          image_tag im.image0, style: 'width: 30%'
        end
      end
    end
  end

  form title: '패키지 추가/수정 하기' do |_f|
    input 'product', label: '법안 상품'
    # package.product.nil? ?
    #     Product.all.each do |product|
    #       panel(product.name) do
    #         input 'product_option_ids', label: '제품', as: :check_boxes, collection: ProductOption.where(product_id: product.id)
    #       end
    #     end :
    #     input 'product_option_ids', label: '제품', as: :check_boxes, collection: package.product.product_options
    if package.product.nil?
      Product.all.each do |product|
        panel(product.name) do
          input 'product_option_ids', label: '제품', as: :check_boxes, collection: ProductOption.where(product_id: product.id)
        end
      end
    else
      input 'product_option_ids', label: '제품', as: :check_boxes, collection: package.product.product_options
    end
    input 'name', label: '패키지 이름'
    input 'remain_count', label: '재고'
    input 'content', label: '패키지 설명'
    input 'price', label: '가격'
    input 'image0', label: '패키지 메인 이미지'

    actions
  end

  controller do
    def create
      super
      product_option_ids = @_params[:package][:product_option_ids]
      create_checked_options(@package.product_options, product_option_ids)
    end

    def update
      super
      product_option_ids = @_params[:package][:product_option_ids]
      delete_uncheck_options(@package.product_options, product_option_ids)
      create_checked_options(@package.product_options, product_option_ids)
    end

    private

    def delete_uncheck_options(old_options, new_option_ids)
      # 체크 해제된 제품을 제거하기 위한 반복문
      print(old_options.count)
      delete_list = []
      old_options.each do |old_option|
        # 기존에 있던 제품이 params 에 없으면 제거하기위한 flag
        flag_find = 0
        # params를 돌면서 기존 제품이 있는지 확인함
        new_option_ids.each { |new_option_id| flag_find = 1 if old_option.id.to_s == new_option_id }
        delete_list.push(ProductOption.find(old_option.id)) if flag_find == 0
      end
      delete_list.each { |delete_elem| old_options.delete(delete_elem) }
    end

    def create_checked_options(old_options, new_option_ids)
      new_option_ids.each do |new_option_id|
        next if new_option_id == ''
        next unless old_options.find_by_id(new_option_id).nil?
        old_options << ProductOption.find(new_option_id)
      end
    end
  end
end
