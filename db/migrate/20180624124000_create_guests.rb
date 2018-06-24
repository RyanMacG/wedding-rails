class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :dietary
      t.boolean :attending, default: false, null: false
      t.boolean :name_updatable, default: false, null: false
      t.integer :rsvp_id
      t.timestamps
    end

    add_index :guests, [:id, :rsvp_id]
  end
end
