ActiveAdmin.register Notice do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :end_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form title: '메인페이지 알림 추가하기!' do |_f|
    input 'name', label: '알림 내용'
    input 'end_time', as: :datepicker,
                      datepicker_options: {
                        min_date: Time.now.to_s,
                        max_date: '+111D'
                      }, label: '종료일'
    actions
  end
end
