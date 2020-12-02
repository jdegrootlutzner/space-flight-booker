class Passenger < ApplicationRecord
  belongs_to :booking
  validates :first_name, :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
