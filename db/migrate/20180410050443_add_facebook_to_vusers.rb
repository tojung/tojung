class AddFacebookToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :facebook_name, :text
    add_column :vusers, :facebook_image, :text
  end
end
