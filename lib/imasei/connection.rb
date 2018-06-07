module Imasei

  require "singleton"

  class Connection

    include Singleton

    def client
      @client ||= Savon.client wsdl: Imasei.configuration.wsdl, follow_redirects: Imasei.configuration.follow_redirects, open_timeout: 300, read_timeout: 300,
                                pretty_print_xml: Imasei.configuration.pretty_print_xml, convert_request_keys_to: :camelcase,
                                encoding: Imasei.configuration.encoding, endpoint: Imasei.configuration.endpoint,
                                ssl_verify_mode: Imasei.configuration.ssl_verify_mode
    end

    def call(service, message)
      request = client.build_request service, message: message
      Imasei::Printer.xp request.body
      client.call service, message
    end

  end

end