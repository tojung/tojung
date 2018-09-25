class AddIpToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :ip, :text
  end
end
