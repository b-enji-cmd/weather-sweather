
class BadTripError < StandardError
  attr_reader :id, :starting, :ending, :travel_time, :weather_at_eta
  def initialize(args)
      @id = nil
      @starting = args[:origin]
      @ending = args[:destination]
      @travel_time = "Impossible Route"
      @weather_at_eta = {}
  end
end
