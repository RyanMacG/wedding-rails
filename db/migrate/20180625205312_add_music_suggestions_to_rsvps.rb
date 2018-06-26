class AddMusicSuggestionsToRsvps < ActiveRecord::Migration[5.2]
  def change
    add_column :rsvps, :music_suggestions, :text
  end
end
