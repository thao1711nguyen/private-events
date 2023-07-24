class CreateEventGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :event_guests do |t|
      t.belongs_to :attendee 
      t.belongs_to :attended_event

      t.timestamps
    end
  end
end
