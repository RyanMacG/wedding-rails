class Rsvp < ApplicationRecord
  def extra_guests?
    number_of_guests.positive?
  end
end
