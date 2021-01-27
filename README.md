# Postcode Checker

## Overview
This Rails application allows you to determine whether a UK postcode is served by your company.

To be served, a postcode must be in a special list, or be within particular LSOAs (blocks of postcodes).

## Configuration
* `config/postcode_allowed_list.yml`
  * contains postcode 'overrides' - postcodes which are always served
* `config/postcode_api.yml`
  * specifies the external service used to lookup postcodes (currently postcodes.io)
* `lib/lsoa_allowed_list.rb` 
  * determines which postcode areas are served (currently Lambeth and Southwark)

## Installation and startup
`bundle install`

`bin/rails s`

## Usage

open this url:

http://localhost:3000/postcodes/check

enter a postcode, and press 'Check postcode'.

The system will reply with whether the postcode is served or not.

## Tests

Feature and Unit tests can be found in the `spec` folder, and can be run like this:

`bin/spring rspec`

## Design

The system has been designed using SOLID principles, to minimise dependencies between classes and thereby ease future change.