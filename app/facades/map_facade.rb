class MapFacade
    def self.get_trip_length(locations)
        MapService.get_length(locations)
    end
end