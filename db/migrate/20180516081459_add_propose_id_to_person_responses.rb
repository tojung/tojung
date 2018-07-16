class AddProposeIdToPersonResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :person_responses, :propose_id, :integer
  end
end
