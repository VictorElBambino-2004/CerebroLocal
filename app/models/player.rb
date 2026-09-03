class Player < ApplicationRecord
  belongs_to :room

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }

  before_validation :sanitize_name

  private

  def sanitize_name
    return if name.blank?

    self.name = ActionController::Base.helpers.strip_tags(name.to_s).strip.truncate(30)
  end
end