class Rsvp < ApplicationRecord
  has_many :guests
  validates_acceptance_of :attending, if: Proc.new { |r| r.guests.any? { |g| g.attending? } }
  accepts_nested_attributes_for :guests

  def extra_guests?
    number_of_guests.positive?
  end
end
