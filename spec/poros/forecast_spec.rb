require 'rails_helper'

RSpec.describe Forecast do
  describe "instance methods" do
    before :all do
      @forecast_data = { 
        current: transient_current[:current],
        hourly: transient_hourly,
        daily: transient_daily
       }
    end

    it "#set_current" do
      forecast = Forecast.new(@forecast_data)
      actual = forecast.set_current(@forecast_data[:current])
      expect(actual.class).to eq Hash
      expect(actual.keys).to eq([:dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :dew_point, :visibility, :weather, :conditions])
    end

    it "#set_hourly" do
      forecast = Forecast.new(@forecast_data)
      actual = forecast.set_hourly(@forecast_data[:hourly])
      expect(actual.class).to eq Array
      expect(actual.first.keys).to eq([:dt, :temp, :conditions, :icon])
      expect(actual.first[:dt].class).to eq Time
      expect(actual.first[:temp].class).to eq Float
      expect(actual.first[:conditions].class).to eq String
      expect(actual.first[:icon].class).to eq String
    end

    it "#set_daily" do
      forecast = Forecast.new(@forecast_data)
      actual = forecast.set_daily(@forecast_data[:daily])
      expect(actual.class).to eq Array
      expect(actual.first.keys).to eq ([:dt, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
      expect(actual.first[:dt].class).to eq Time
      expect(actual.first[:sunrise].class).to eq Time
      expect(actual.first[:sunset].class).to eq Time
      expect(actual.first[:max_temp].class).to eq Float
      expect(actual.first[:min_temp].class).to eq Float
      expect(actual.first[:conditions].class).to eq String
    end

  end
end
