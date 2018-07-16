class AddDisagreeHashToPersonResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :person_responses, :disagree_hash, :text
  end
end
