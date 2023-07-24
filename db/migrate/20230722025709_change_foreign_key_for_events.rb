class ChangeForeignKeyForEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :users_id, :creator_id
  end
end
