class Room < ApplicationRecord
  has_many :players, dependent: :destroy

  validates :code, presence: true, uniqueness: true, format: { with: /\A\d{4}\z/, message: "debe ser de 4 dígitos" }
  validates :host_token, presence: true, uniqueness: true

  before_validation :generate_code, on: :create
  before_validation :generate_host_token, on: :create

  private

  def generate_code
    return if code.present?

    loop do
      self.code = SecureRandom.random_number(1000..9999).to_s
      break unless Room.exists?(code: code)
    end
    self.status ||= "waiting"
  end

  def generate_host_token
    self.host_token ||= SecureRandom.urlsafe_base64(32)
  end
end
