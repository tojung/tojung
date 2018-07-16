class AddAgreeHashToPersonResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :person_responses, :agree_hash, :text
  end
end
