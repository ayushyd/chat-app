class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy

         validates_uniqueness_of :username

         scope :all_except, ->(user) { where.not(id: user) }

         after_create_commit { broadcast_append_to "users" }

         has_many :messages, dependent: :destroy

         has_many :chat_rooms, foreign_key: :created_by, dependent: :destroy

         has_many :reactions, dependent: :destroy

end
