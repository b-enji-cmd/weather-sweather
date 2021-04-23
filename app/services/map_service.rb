class MapService 
    def self.get_data(location)
        response = conn.get("/geocoding/v1/address") do |f|
            f.params['key'] = ENV['MAPQUEST_API']
            f.params['location'] = location			
        end
        json = JSON.parse(response.body, symbolize_names: true)
      end
      
      def self.conn
        Faraday.new('http://www.mapquestapi.com')
      end

end