ActiveAdmin.register BestBill do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :assos, :category, :title, :content, :conference_time, :conference_doc,
              :delay_time, :sangjung_time, :review_doc, :footchair_name, :editor_name, :designer_name, :image_0,
              :image1, :problems_content
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
