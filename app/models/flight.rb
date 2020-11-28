class Flight < ApplicationRecord
  validate :circular_flight
  belongs_to :from, class_name: 'Airport'
  belongs_to :to, class_name: 'Airport'
  validates :from, :to, :price, presence: true

  def circular_flight
    return unless from == to

    errors.add(:from, 'must be different than \'to\'')
    errors.add(:to, 'must be different than \'from\'')
  end
end
