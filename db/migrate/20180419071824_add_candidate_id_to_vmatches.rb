class AddCandidateIdToVmatches < ActiveRecord::Migration[5.1]
  def change
    add_column :vmatches, :candidate_id, :integer
  end
end
