ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  menu label: '법안 상품'
  # has_many :packages
  # has_many :product_options
  permit_params :name,
                :subname,
                :start_date,
                :end_date,
                :youtb_url,
                :video_text,
                :bill_url,
                :assos,
                :fb_url,
                :image0,
                :image1,
                :goal_money,
                :category,
                :visible,
                :bill_id,
                :bill_name,
                :status

  form title: '법안 상품 추가/수정 하기' do |_f|
    inputs 'Details' do
      input 'name', label: '법안 상품 이름'
      input 'subname', label: '부 제목'
      input 'category', label: '카테고리'

      input 'youtb_url', label: '유튜브 주소'
      input 'video_text', label: '유튜브 영상 설명'

      input 'fb_url', label: '페이스북 그룹 주소'

      input 'start_date', as: :datepicker,
                          datepicker_options: {
                            min_date: '2018-08-08',
                            max_date: '+9D'
                          }, label: '시작일'
      input 'end_date', as: :datepicker,
                        datepicker_options: {
                          min_date: '2018-08-08',
                          max_date: '+9D'
                        }, label: '종료일'

      input 'goal_money', label: '펀딩 목표 금액'
    end

    inputs 'Bill Infos' do
      input 'assos', label: '상임위원회 이름'
      input 'bill_id', label: '법안 번호'
      input 'bill_name', label: '법안 이름'
      input 'bill_url', label: '법안 링크'
    end

    inputs 'Images' do
      input 'image0', label: '상품 메인 이미지'
      input 'image1', label: '패키지 정리 이미지'
    end

    input 'visible', label: '공개 여부'

    # panel 'Markup' do
    #  "The following can be used in the content below..."
    # end
    para 'Press cancel to return to the list without saving.'
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
