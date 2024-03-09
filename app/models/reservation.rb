class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet
  # validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'is not a valid email format' }
  validates :date, :sheet_id, :schedule_id, :name, presence: true
  validates :date, uniqueness: { scope: %i[schedule_id sheet_id] }
end
