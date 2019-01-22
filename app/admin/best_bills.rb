ActiveAdmin.register BestBill do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :assos, :category, :title, :content, :conference_time, :conference_doc,
                :delay_time, :sangjung_time, :review_doc, :footchair_name, :editor_name, :designer_name, :image_0,
                :image1, :problems_content, :main, :bill_start, :bill_id, :sangjung_date
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form title: '베스트 법안 추가/수정 하기' do |_f|
    input 'category', label: '카테고리'
    input 'title', label: '페이지 제목'
    input 'problems_content', label: '문제 상황 ( - 문제 (엔터) - 문제 (엔터) )'
    input 'main', label: '메인 법안 여부'
    input 'designer_name', label: '디자이너 이름'
    input 'editor_name', label: '에디터 이름'
    input 'image_0', label: '메인 이미지'

    input 'bill_id', label: '의안번호'
    input 'content', label: '법안 핵심 내용'
    input 'conference_time', label: '회의횟수'

    input 'conference_doc', label: '법안 심사회의록'
    input 'review_doc', label: '검토 보고서'

    input 'sangjung_time', label: '상정에 걸린기간'

    actions
  end

end
