class AddPhoneNumberToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :phone_number, :text
  end
end
