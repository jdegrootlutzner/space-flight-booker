class Flight < ApplicationRecord
  belongs_to :from, class_name: 'Airport'
  belongs_to :to, class_name: 'Airport'
  validate :circular_flight
  validates :from, :to, :price, presence: true

  def circular_flight
    return unless from == to

    errors.add(:from, 'must be different than \'to\'')
    errors.add(:to, 'must be different than \'from\'')
  end

  # Notes:
  # 1) I find the hash so much more readable than Strings with '?'
  # 2) returning Flight.none avoids later checks if @flights exists
  # 3) could use #readonly bc. i'm not updating model
  def self.search(params)
    return Flight.none unless params[:search]

    Flight.where(from_id: params[:flight][:from_id],
                 to_id: params[:flight][:to_id],
                 date: build_date(params).beginning_of_day..build_date(params).end_of_day)
          .order(:date)
  end

  def readable_time
    date.strftime('%I:%M %p')
  end

  def readable_date
    date.strftime('%A, %B %e, %Y')
  end

  def label_html_tag
    "booking_flight_id_#{self.id}"
  end

  private 


  def self.build_date(params)
    Date.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
  end

end
