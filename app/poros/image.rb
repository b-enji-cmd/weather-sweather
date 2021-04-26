class Image
    attr_reader :id, :location, :image_url, :credit
    def initialize(args, location)
        @id = nil
        @location = location
        @image_url = args[:url]
        @credit = set_credit(args)
    end

    def set_credit(args)
        { 
            source: "https://www.pexels.com",
            author: args[:photographer],
            logo: "https://theme.zdassets.com/theme_assets/9028340/1e73e5cb95b89f1dce8b59c5236ca1fc28c7113b.png"
         }
    end
end