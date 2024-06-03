class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :reaction_type, presence: true

  after_create_commit do
    broadcast_append_to "reactions_#{message.id}", partial: "reactions/reaction", locals: { reaction: self }
  end
end
