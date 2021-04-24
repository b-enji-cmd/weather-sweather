class WeatherService 
    def self.get_weather(location)
        response = conn.get("/data/2.5/onecall") do |f|
          f.params['lat'] = location[:lat]
          f.params['lon'] = location[:lng]
          f.params['exclude'] = "minutely"
          f.params['appid'] = ENV['WEATHER_API']
        end
        json = JSON.parse(response.body, symbolize_names: true)
      end
      
      def self.conn
        Faraday.new('https://api.openweathermap.org')
      end

end