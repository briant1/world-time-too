require 'custom_geonames_geocoder'
Geokit::default_units = :miles
Geokit::default_formula = :sphere

Geokit::Geocoders::request_timeout = 3

Geokit::Geocoders::CustomGeonamesGeocoder.key = ENV['GEONAMES_NAME']

Geokit::Geocoders::CustomGeonamesGeocoder.premium = false