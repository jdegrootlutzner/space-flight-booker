class Booking < ApplicationRecord
  has_many :passengers, dependent: :destroy
  belongs_to :flight
  validates :num_passengers, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
  accepts_nested_attributes_for :passengers

end
