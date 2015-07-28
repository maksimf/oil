require 'json'

module OilFetcher
  class Fetcher
    def call
      json = fetch_json OilFetcher.configuration.uri
      return unless json

      Oil.new(extract_params(json))
    end

    private

    def fetch_json(uri)
      uri = URI(uri)
      file = Net::HTTP.get uri
      return unless file

      JSON.parse file
    rescue *exceptions => e
      OilFetcher.configuration.logger.warn e

      nil
    end

    def extract_params(json)
      {
        rate: json["data"][0][4],
        date: json["data"][0][0]
      }
    end

    def exceptions
      [Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, Errno::ECONNREFUSED, EOFError,
        Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError, JSON::ParserError]
    end
  end
end
