# <b>This class is intended to get the full address information for a given zip
# code.</b> # In order to do that, this class receives the zip code value with
# its 8 digits, normalizes by removing dots, hyphens and the like, then,
# requests the information about it from the brazilian post office (Correios)
# and returns a hash with the neighborhood, zip code, city, complement, address
# name and state.
module CorreiosToolkit
  class ConsultaCep < CorreiosToolkit::Base

    # Sends the received value to the Correios' webservice parses the response
    # and returns it.
    #
    # ==== Attribute
    #
    # * <tt>:cep [String][required]</tt> - the zip code to search
    #
    # ==== Return Object Attribute
    #
    # * <tt>:bairro</tt> - The neighborhood
    # * <tt>:cep</tt> - The requested zip code
    # * <tt>:cidade</tt> - The city
    # * <tt>:complemento2</tt> - The complement
    # * <tt>:end</tt> - The street name
    # * <tt>:uf</tt> - The state
    #
    # ==== Example
    #
    # *The code* = CorreiosToolkit::ConsultaCep.request_data_for('01310000')
    # *Returns* = {
    #   "bairro"=>"Bela Vista",
    #   "cep"=>"01310000",
    #   "cidade"=>"São Paulo",
    #   "complemento2"=>"- até 610 - lado par",
    #   "end"=>"Avenida Paulista",
    #   "uf"=>"SP"
    # }
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