class MapService 
    def self.get_lat(location)
        response = conn.get("/geocoding/v1/address") do |f|
            f.params['key'] = ENV['MAPQUEST_API']
            f.params['location'] = location			
        end
        json = JSON.parse(response.body, symbolize_names: true)
				json[:results][0][:locations][0][:displayLatLng]
      end
      
      def self.conn
        Faraday.new('http://www.mapquestapi.com')
      end

end