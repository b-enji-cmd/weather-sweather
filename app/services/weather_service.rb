class WeatherService 
    def self.get_weather(poem)
        response = conn.get("/instances/92a78b4e-bdaf-496f-b510-7d8168ffb7ce/v3/tone") do |f|
          f.params['version'] = '2017-09-21'
          f.params['text'] = poem
        end
        json = JSON.parse(response.body, symbolize_names: true)
      end
      
      def self.conn
        Faraday.new('https://api.us-south.tone-analyzer.watson.cloud.ibm.com') do |conn|
          conn.basic_auth('apikey', 'bJVcMLupFmz1Vc1gxwkIRHxvbHYAs0GlxVY4fuTcUa4Q')
        end
      end

end