class CreateRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|
      t.string :name
      t.string :dietary
      t.string :access_key, unique: true
      t.boolean :attending, default: false, null: false
      t.integer :number_of_guests, default: 0
      t.timestamps
    end

    add_index :rsvps, :access_key
  end
end
