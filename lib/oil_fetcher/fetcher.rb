require 'json'

module OilFetcher
  class Fetcher
    def call
      @config = OilFetcher.configuration
      json = fetch_json

      return unless json

      Oil.new(extract_params(json))
    end

    private

    def fetch_json
      uri = URI(@config.uri)
      http = Net::HTTP::new(uri.host, uri.port, @config.proxy_host, @config.proxy_port)

      http.use_ssl = true if @config.use_ssl
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if @config.skip_ssl_verification

      file = http.get(uri).body

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
