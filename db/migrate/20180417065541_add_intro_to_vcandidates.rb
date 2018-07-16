class AddIntroToVcandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :vcandidates, :intro, :text
  end
end
