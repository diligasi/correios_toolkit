require 'rest-client'
require 'active_support/core_ext'

module CorreiosToolkit
  class Base
    class GatewayError < StandardError; end
    class LengthError < StandardError; end

    SOAP_URL = 'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl'.freeze
    CORREIOS_DEFAULT_ENCODE = 'ISO-8859-1'.freeze

    protected

    def request(payload:, response_node:)
      response = RestClient.post(SOAP_URL, payload, content_type: 'application/xml')

      if response.code.between?(200, 299)
        json_parse(response.body, response_node)
      else
        raise(RestClient::ExceptionWithResponse, response)
      end
    rescue RestClient::ExceptionWithResponse => e
      raise(GatewayError, json_parse(e.response.body))
    end

    private

    def json_parse(xml, node = nil)
      xml.encode!('UTF-8', CORREIOS_DEFAULT_ENCODE)

      if node.present?
        success_parser(xml, node)
      else
        error_parser(xml)
      end
    end

    def success_parser(xml, node)
      Hash.from_xml(xml).dig('Envelope', 'Body', "#{node}Response", 'return').with_indifferent_access
    end

    def error_parser(xml)
      Hash.from_xml(xml).dig('Envelope', 'Body', 'Fault', 'faultstring')
    end
  end
end