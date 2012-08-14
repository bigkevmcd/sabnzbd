require 'net/http'
require 'uri'
require 'json'
require 'cgi'

module Sabnzbd
  # This class provides all the methods for using the Sabnzbd API.
  class Client

    # @option options [String] :api_key ("") The Sabnzbd username for access.
    # @option options [String] :server ("") The server API endpoint.
    # @return [Object] the object.
    def initialize(options = {})

      options = { api_key: '',
                  server: '',
                  }.merge(options)

      @server = options[:server]
      @api_key = options[:api_key]
      raise ArgumentError, 'No :api_key provided' if options[:api_key].nil? || options[:api_key].empty?
      raise ArgumentError, 'No :server provided' if options[:server].nil? || options[:server].empty?
    end

    # Makes an API call to a Sabnzbd server returns JSON parsed result
    # @param [String] mode Sabnzbd API call to request
    # @param [Hash] options the options to make the API call with, these are
    #   passed as GET parameters to the Sabnzbd server.
    # @return [Hash] JSON parsed result from the remote server
    def make_json_request(mode, options = {})
      options = { mode: mode,
                  apikey: @api_key,
                  output: 'json' }.merge(options)
      path = "/api"
      uri = URI::join(URI.parse(@server), path)
      uri.query = URI.encode_www_form( options )
      JSON.parse(Net::HTTP.get(uri))
    end

    # Retrieves the simple queue information from the Sabnzbd queue
    def simple_queue
      make_json_request('qstatus')
    end
  end
end

Dir[File.join(File.dirname(__FILE__), 'sabnzbd/**/*.rb')].sort.each { |lib| require lib }
