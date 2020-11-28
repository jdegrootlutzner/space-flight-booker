class Airport < ApplicationRecord
  validates :location, presence: true, uniqueness: true
  validates :abbreviation, length: { is: 3 }, uniqueness: true
  has_many :departing_flights, class_name: 'Flight', foreign_key: 'from_id'
  has_many :arriving_flights, class_name: 'Flight', foreign_key: 'to_id'
end
