class AddSpecialnumToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :specialnum, :integer
  end
end
