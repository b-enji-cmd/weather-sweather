class MapService 
    def self.get_lat(location)
        response = conn.get("/geocoding/v1/address") do |f|
            f.params['key'] = ENV['MAPQUEST_API']
            f.params['location'] = location			
        end
        json = JSON.parse(response.body, symbolize_names: true)
				json[:results][0][:locations][0][:displayLatLng]
      end

      def self.get_length(locations)
        response = conn.get("/directions/v2/route") do |f|
          f.params['key'] = ENV['MAPQUEST_API']
          f.params['from'] = locations[:origin]
          f.params['to'] = locations[:destination]		
        end
        json = JSON.parse(response.body, symbolize_names: true)
        json[:route][:time]
      end
      
      def self.conn
        Faraday.new('http://www.mapquestapi.com')
      end

end