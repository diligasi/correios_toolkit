require 'correios_toolkit/version'
require 'correios_toolkit/base'
require 'correios_toolkit/consulta_cep'

module CorreiosToolkit
  class Error < StandardError; end
  class GatewayError < StandardError; end
  class LengthError < StandardError; end

  def self.consulta_cep(cep)
    CorreiosToolkit::ConsultaCep.request_data_for(cep: cep)
  end
end
