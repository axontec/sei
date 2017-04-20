module Imasei

  require "singleton"

  class Connection

    include Singleton

    def client
      @client ||= Savon.client wsdl: Imasei.configuration.wsdl, follow_redirects: Imasei.configuration.follow_redirects,
                                pretty_print_xml: Imasei.configuration.pretty_print_xml, convert_request_keys_to: :camelcase
    end

    def call(service, message)
      request = client.build_request service, message: message
      Imasei::Printer.xp request.body
      client.call service, message
    end

  end

end