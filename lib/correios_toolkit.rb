require 'correios_toolkit/version'
require 'correios_toolkit/base'
require 'correios_toolkit/consulta_cep'

##
# This module's static methods are the entry point for using CorreiosToolkit.
module CorreiosToolkit

  # Get address' information by zip code
  #
  # Example:
  #   # Valid zip code (without dots, hyphens and the like)
  #   >> CorreiosToolkit.consulta_cep('01310000')
  #   => { "bairro"=>"Bela Vista", "cep"=>"01310000", "cidade"=>"São Paulo", "complemento2"=>"- até 610 - lado par", "end"=>"Avenida Paulista", "uf"=>"SP" }
  #
  #   # Valid zip code (with dots, hyphens and the like)
  #   >> CorreiosToolkit.consulta_cep('01310-000')
  #   => { "bairro"=>"Bela Vista", "cep"=>"01310000", "cidade"=>"São Paulo", "complemento2"=>"- até 610 - lado par", "end"=>"Avenida Paulista", "uf"=>"SP" }
  #
  #   # Invalid zip code (less/more than 8 numbers)
  #   >> CorreiosToolkit.consulta_cep('01310000000')
  #   => CorreiosToolkit::Base::LengthError (Wrong CEP format, expected CEP to have 8 numbers but 11 was found.)
  #
  #   # Invalid zip code (nonexistent zip code - zip code not found)
  #   >> CorreiosToolkit.consulta_cep('01310005')
  #   => CorreiosToolkit::Base::GatewayError (CEP NAO ENCONTRADO)
  #
  # Param:
  #  <tt>:cep</tt> [String] - The zip code to verify, it must have 8 number
  #
  # Return:
  #   # Hash object with indifferent access attributes
  #   # => Hash attributes:
  #   # <tt>:bairro</tt>       - The neighborhood name
  #   # <tt>:cep</tt>          - The requested zip code
  #   # <tt>:cidade</tt>       - The city name
  #   # <tt>:complemento2</tt> - The complement when available
  #   # <tt>:end</tt>          - The street name
  #   # <tt>:uf</tt>           - The state abbreviation
  def self.consulta_cep(cep)
    CorreiosToolkit::ConsultaCep.request_data_for(cep: cep)
  end
end
