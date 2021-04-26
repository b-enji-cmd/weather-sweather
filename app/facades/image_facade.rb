class ImageFacade
    def self.get_background(location)
			transient_background = ImageService.get_background(location)[:photos].first
            Image.new(transient_background, location)
           
    end
end