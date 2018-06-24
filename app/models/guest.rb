class Guest < ApplicationRecord
  belongs_to :rsvp
  validates_presence_of :name, if: Proc.new { |g| g.attending? }
  before_update :freeze_name, unless: Proc.new { |g| g.name_updatable? }

  def freeze_name
    restore_attribute!(:name)
  end
end
