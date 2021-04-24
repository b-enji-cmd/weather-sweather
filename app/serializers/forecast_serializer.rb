class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current, :daily, :hourly
end
