# <b>This class is intended to get the full address information for a given zip
# code.</b> In order to do that, this class receives the zip code value with its
# 8 digits, normalizes it by removing dots, hyphens and the like, then, requests
# the information about it from the brazilian post office (Correios) and returns
# a hash with the corresponding information.
module CorreiosToolkit
  class ConsultaCep < CorreiosToolkit::Base

    def self.request_data_for(cep:)
      consulta_cep = new(cep: cep)
      consulta_cep.data
    end

    def initialize(cep:)
      cep = cep.scan(/[0-9]/).join

      raise(LengthError, "Wrong CEP format, expected CEP to have 8 numbers but #{cep.size} was found.") if cep.size != 8

      @cep = cep
    end

    def data
      request(payload: payload, response_node: 'consultaCEP')
    end

    private

    def payload
      <<-EOXML
        <x:Envelope xmlns:x="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cli="http://cliente.bean.master.sigep.bsb.correios.com.br/">
          <x:Header/>
          <x:Body>
            <cli:consultaCEP>
              <cep>#{@cep}</cep>
            </cli:consultaCEP>
          </x:Body>
        </x:Envelope>
      EOXML
    end
  end
end