class AddReferenceToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :users, column: :creator_id, index: true
  end
end
