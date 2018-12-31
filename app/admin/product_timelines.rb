ActiveAdmin.register ProductTimeline do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :image0, :issued_at, :product_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form title: '타임라인' do |_f|
    input 'product'
    input 'name'
    input 'image0'
    input 'issued_at', as: :datepicker,
                       datepicker_options: {
                         min_date: '2018-08-08',
                         max_date: '+9D'
                       }, label: '시간'

    actions
  end
end
