class AddCampaignContentToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :campaign_content, :text
  end
end
