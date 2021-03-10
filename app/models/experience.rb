class Experience < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :deals

  with_options presence: true do
    validates :title
    validates :content
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end
