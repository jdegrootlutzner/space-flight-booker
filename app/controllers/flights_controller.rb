class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.search params
  end

  # I am a bit confused about Strong Parameters
  # since I am only using params to search, I think I am ok
  # I was having trouble accepting params from my form
  # I think because there would be multiple inputs for 
  # #require 
  # I could use a Flight model Form 
  # which might be better
end
