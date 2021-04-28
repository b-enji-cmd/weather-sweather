class MapFacade
    def self.get_trip_length(locations)
        MapService.get_length(locations)
    end

    def self.get_location_details(location)
        MapService.get_lat(location)
    end
end