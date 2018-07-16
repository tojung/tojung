class AddBirthToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :birth_year, :integer
    add_column :vusers, :birth_month, :integer
    add_column :vusers, :birth_day, :integer
  end
end
