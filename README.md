# Ruby library for an easy integration with the Correios (brazilian post office service) SOAP web service.

![GitHub license](https://img.shields.io/github/license/diligasi/correios_toolkit)
[![GitHub version](https://badge.fury.io/gh/diligasi%2Fcorreios_toolkit.svg)](https://badge.fury.io/gh/diligasi%2Fcorreios_toolkit)
![GitHub top language](https://img.shields.io/github/languages/top/diligasi/correios_toolkit)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/diligasi/correios_toolkit)

The _Correios do Brasil_ (brazilian post office service) makes available, free of charge, to customers
with or without a contract, a set of services accessible via a SOAP Web service that enable the
integration from customer's systems with the Correios' technological environment. Therefore, this gem
aims to create an abstraction layer that facilitates the communication and consumption of the services
provided from ruby applications.

## Requirements
Ruby 2.0 and newer are supported. Alternative interpreters compatible with 2.0+ should work as well.

Earlier Ruby versions such as 1.8.7, 1.9.2, and 1.9.3 were not tested, don't have any official support,
and will not receive features and/or security updates.

The _correios_toolkit_ gem depends on these other gems for usage at runtime:

* [activesupport](https://rubygems.org/gems/activesupport)
* [rest-client](https://rubygems.org/gems/rest-client)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'correios_toolkit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install correios_toolkit

## Usage
Basic usage:

```ruby
require 'correios_toolkit'

CorreiosToolkit.consulta_cep('01310000')
```

## Current available services
On the following list are the services already available on this gem:

* _ConsultaCEP_
  * Get address' information by zip code
* Others are coming soon...

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/diligasi/correios_toolkit. This
project is intended to be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct
Everyone interacting in the CorreiosToolkit project's codebases, issue trackers, chat rooms and mailing
lists is expected to follow the [code of conduct](https://github.com/diligasi/correios_toolkit/blob/master/CODE_OF_CONDUCT.md).
