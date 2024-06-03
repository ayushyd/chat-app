class AddAttachmentToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :attachment, :string
  end
end
