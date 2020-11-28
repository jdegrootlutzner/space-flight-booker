# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DAILY_NUMBER_OF_FLIGHTS = 5
DAYS_IN_THE_FUTURE = 7
TIME_INTERVAL_MINUTES = 15
MINUTES_IN_HOUR = 60
NUMBER_OF_INTERVALS = MINUTES_IN_HOUR * 24 / TIME_INTERVAL_MINUTES
planets = %w[Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune]

DISTANCES = {
  Mercury: 0.39,
  Venus: 0.723,
  Earth: 1,
  Mars: 1.524,
  Jupiter: 5.203,
  Saturn: 9.539,
  Uranus: 19.18,
  Neptune: 30.06
}
Airport.create(location: 'Mercury', abbreviation: 'MER')
Airport.create(location: 'Venus', abbreviation: 'VEN')
Airport.create(location: 'Earth', abbreviation: 'EAR')
Airport.create(location: 'Mars', abbreviation: 'MAR')
Airport.create(location: 'Jupiter', abbreviation: 'JUP')
Airport.create(location: 'Saturn', abbreviation: 'SAT')
Airport.create(location: 'Uranus', abbreviation: 'URA')
Airport.create(location: 'Neptune', abbreviation: 'NEP')
# year, month, day, hour, minute

private_methods

def random_time(date)
  date.to_time + TIME_INTERVAL_MINUTES * rand(1...NUMBER_OF_INTERVALS) * MINUTES_IN_HOUR
end

def calculate_distance(origin, destination)
  (DISTANCES[destination.to_sym] - DISTANCES[origin.to_sym]).abs
end

def calculate_duration(origin, destination)
  calculate_distance(origin, destination) * 2
end

def calculate_price(origin, destination)
  145 + calculate_duration(origin, destination) * 38 + rand(0...300)
end

def create_flight(date, origin, destination, origin_id, destination_id)
  Flight.create(date: random_time(date),
                duration: calculate_duration(origin, destination).ceil,
                price: calculate_price(origin, destination),
                from_id: origin_id,
                to_id: destination_id)
end

Date.today.upto(Date.today + DAYS_IN_THE_FUTURE).each do |date|
  planets.each do |origin|
    planets.each do |destination|
      origin_id = Airport.find_by(location: origin).id
      destination_id = Airport.find_by(location: destination).id
      (1..DAILY_NUMBER_OF_FLIGHTS).each do
        create_flight(date, origin, destination, origin_id, destination_id) unless origin == destination
      end
    end
  end
end
