lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'correios_toolkit/version'

Gem::Specification.new do |spec|
  spec.name          = 'correios_toolkit'
  spec.version       = CorreiosToolkit::VERSION
  spec.authors       = ['Diogo de Lima']
  spec.email         = ['diligasi@gmail.com']

  spec.summary       = 'Integration gem with Correios do Brasil.'
  spec.description   = <<-EOTEXT
    The Correios do Brasil (brazilian post office service) makes available, free of charge, to
    customers with or without a contract, a set of services accessible via Web services that
    enable the integration of customer's systems with the technological environment of the
    Correios.
    Therefore, this gem aims to create an abstraction layer that facilitates the communication
    and consumption of the services provided from ruby applications.
  EOTEXT
  spec.homepage      = 'https://rubygems.org/gems/correios_toolkit'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/diligasi/correios_toolkit'
  spec.metadata['changelog_uri']   = 'https://github.com/diligasi/correios_toolkit/releases'

  spec.files         = Dir['{lib}/**/*.rb', 'bin/*', 'LICENSE', '*.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
