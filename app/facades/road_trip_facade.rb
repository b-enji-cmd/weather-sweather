class RoadTripFacade
    def self.get_trip(locations, transient_trip, transient_weather)

            RoadTrip.new({ 
                start_city:  locations[:origin], 
                end_city: locations[:destination],
                travel_time: transient_trip,
                weather_at_eta: transient_weather
             })
    end
end
