class ImageService 
    def self.get_background(location)
        response = conn.get("/v1/search") do |f|
          f.params['query'] = "#{location} skyline"
          f.headers['Authorization'] = ENV['PEXELS_API']
        end
        json = JSON.parse(response.body, symbolize_names: true)
      end
      
      def self.conn
        Faraday.new('https://api.pexels.com')
      end

end