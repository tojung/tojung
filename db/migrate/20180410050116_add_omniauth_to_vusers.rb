class AddOmniauthToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :provider, :string
    add_column :vusers, :uid, :string
  end
end
