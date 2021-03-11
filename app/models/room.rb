class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  # has_many :room_user_chats
  # has_many :users, through: :room_user_chats
  
  validates :name, presence: true
end