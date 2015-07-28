module OilFetcher
  class Oil
    attr_accessor :rate, :date

    def initialize(rate:, date:)
      raise ArgumentError.new("some of params (rate, date) is nil") unless rate && date

      @rate = rate
      @date = Date.parse(date)
    end
  end
end
