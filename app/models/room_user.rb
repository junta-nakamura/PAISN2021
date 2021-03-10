class RoomUser < ApplicationRecord
  t.references :room, foreign_key: true
  t.references :user, foreign_key: true
end
