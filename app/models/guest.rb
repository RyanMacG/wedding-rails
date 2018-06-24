class Guest < ApplicationRecord
  belongs_to :rsvp
  before_update :freeze_name, unless: Proc.new { |g| g.name_updatable? }

  def freeze_name
    restore_attribute!(:name)
  end
end
