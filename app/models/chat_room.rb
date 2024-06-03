class ChatRoom < ApplicationRecord
	has_many :messages, dependent: :destroy
	belongs_to :user, foreign_key: :created_by
	validates_uniqueness_of :name
end
