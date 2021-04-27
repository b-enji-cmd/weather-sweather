class Forecast
    attr_reader :current, :hourly, :daily, :id
    def initialize(args)
        @id = nil
        @current = set_current(args[:current])
        @hourly = set_hourly(args[:hourly])
        @daily = set_daily(args[:daily])

    end

    def set_current(args)
            {   :dt=> Time.at(args[:dt]),
                :sunrise=> Time.at(args[:sunrise]),
                :sunset=> Time.at(args[:sunset]),
                :temp=> ((args[:temp] - 273.15) * 9/5 + 32).round(2),
                :feels_like=> ((args[:feels_like] - 273.15) * 9/5 + 32).round(2),
                :humidity=>args[:humidity],
                :dew_point=>args[:dew_point],
                :visibility=>args[:visibility],
                :weather=> args[:weather][0][:icon],
                :conditions=> args[:weather][0][:description]
            }
    end

    def set_hourly(args)
        args.map do |forecast|
            {   :dt=> Time.at(forecast[:dt]),
                :temp=> ((forecast[:temp] - 273.15) * 9/5 + 32).round(2),
                :conditions=> forecast[:weather][0][:description],
                :weather=> forecast[:weather][0][:icon]
            }
        end
    end

    def set_daily(args)
        args.map do |forecast|
            { 
                :dt=> Time.at(forecast[:dt]),
                :sunrise=> Time.at(forecast[:sunrise]),
                :sunset=> Time.at(forecast[:sunset]),
                :max_temp=>forecast[:temp][:max],
                :min_temp=>forecast[:temp][:min],
                :conditions=> forecast[:weather][0][:description],
                :icon=> forecast[:weather][0][:icon]
            }
        end
    end
end