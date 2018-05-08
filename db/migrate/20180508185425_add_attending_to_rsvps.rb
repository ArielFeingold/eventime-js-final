class AddAttendingToRsvps < ActiveRecord::Migration[5.2]
  def change
    add_column :rsvps, :attending, :boolean
  end
end
