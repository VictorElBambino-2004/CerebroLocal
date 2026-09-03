class Player < ApplicationRecord
  belongs_to :room

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  validates :token, presence: true, uniqueness: true

  before_validation :sanitize_name
  before_validation :generate_token, on: :create

  private

  def sanitize_name
    return if name.blank?

    self.name = ActionController::Base.helpers.strip_tags(name.to_s).strip.truncate(30)
  end

  def generate_token
    self.token ||= SecureRandom.urlsafe_base64(32)
  end
end
