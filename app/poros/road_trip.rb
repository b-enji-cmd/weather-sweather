class RoadTrip
    attr_reader :start_city, :end_city, :travel_time, :weather_at_eta, :id
    def initialize(args)
        @id = nil
        @start_city = args[:start_city]
        @end_city = args[:end_city]
        @travel_time = args[:travel_time]
        @weather_at_eta = set_eta_weather(args[:weather_at_eta])
    end

    def set_eta_weather(args)
        if @travel_time.nil?
            "Invalid Parameter"
        else
            forecast = ((@travel_time / 60 ) / 60) > 48 ? args[:daily].find_all{|forecast| forecast[:dt].to_i  <= (Time.now.to_i + @travel_time)}.last : args[:hourly].find_all{|forecast| forecast[:dt].to_i  <= (Time.now.to_i + @travel_time)}.last
            { 
                tempterature: (( forecast[:temp] - 273.15) * 9/5 + 32).round(2),
                condition: ( forecast[:weather][0][:description])
             }
        end
        
    end
end