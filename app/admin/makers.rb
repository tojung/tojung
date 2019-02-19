ActiveAdmin.register Maker do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :image0
  form title: 'm' do |_f|
    input 'image0', label: '메인 이미지'
    actions
  end
end
