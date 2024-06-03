class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  has_many :reactions, dependent: :destroy
  has_one_attached :attachment

  validates :context, presence: true

  after_create_commit do 
    broadcast_append_to "chat_#{chat_room.id}", partial: "messages/message", locals: { message: self } 
  end
end
