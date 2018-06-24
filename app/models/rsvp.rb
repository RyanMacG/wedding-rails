class Rsvp < ApplicationRecord
  has_many :guests

  def extra_guests?
    number_of_guests.positive?
  end
end
