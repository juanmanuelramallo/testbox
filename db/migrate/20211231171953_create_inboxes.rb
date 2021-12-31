class CreateInboxes < ActiveRecord::Migration[7.0]
  def change
    create_table :inboxes do |t|
      t.string :name
      t.uuid :identifier

      t.timestamps
    end
  end
end
