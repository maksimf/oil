require 'logging'
require 'oil_fetcher/version'
require 'oil_fetcher/fetcher'
require 'oil_fetcher/oil'
require 'oil_fetcher/configuration'

module OilFetcher
  class << self
    attr_writer :configuration
  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.call
    fetcher = OilFetcher::Fetcher.new
    fetcher.call
  end
end
