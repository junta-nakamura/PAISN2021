class RemoveMessageFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :message, :string
  end
end
