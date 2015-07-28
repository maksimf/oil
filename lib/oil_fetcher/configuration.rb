module OilFetcher
  class Configuration
    attr_accessor :uri, :logger

    def initialize
      @uri = "https://www.quandl.com/api/v1/datasets/CHRIS/ICE_B1.json?rows=1"
      @logger = defined?(Rails) ? Rails.logger : Logging.logger(STDOUT)
    end
  end
end
