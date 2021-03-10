class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one_attached :image
  has_many :experiences
  has_many :deals
  has_many :room_users ,dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :deals
  has_one_attached :image

  # with_options presence: true do
  #   validates :email
  #   validates :encrypted_password   
  #   validates :nickname
  #   validates :last_name
  #   validates :first_name
  #   validates :last_name_kana
  #   validates :first_name_kana
  #   validates :birthday
  #   validates :industry_id
  #   validates :occupation_id
  #   validates :working_period_id
  #   validates :position_id
  #   validates :number_of_employees_id
  #   validates :gender_id
  #   validates :age_id
  # end
end
