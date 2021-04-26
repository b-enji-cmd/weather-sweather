class TeleportService
    def self.get_salaries(search)
      response = conn.get('/api/urban_areas/slug:#{search}/salaries') do |f|
        f.params['limit'] = 1
      end
      parse(response)['_links']['salaries']
    end

    def self.conn
      Faraday.new('https://api.teleport.org')
    end

end
