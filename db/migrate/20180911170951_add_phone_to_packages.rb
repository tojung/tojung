class AddPhoneToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :phone, :string
  end
end
