module Geokit
  module Geocoders
    # Another geocoding web service
    # http://www.geonames.org
    class CustomGeonamesGeocoder < Geocoder
      config :key, :premium

      private

      # Template method which does the geocode lookup.
      def self.do_geocode(address, _=nil)
        process :xml, submit_url(address)
      end

      def self.submit_url(address)
        if key.nil? || key.empty?
          raise(Geokit::Geocoders::GeocodeError, 'Geonames requires a key to use their service.')
        end

        address_str = address.is_a?(GeoLoc) ? address.to_geocodeable_s : address
        # geonames need a space seperated search string
        address_str.gsub!(/,/, ' ')
        params = "/postalCodeSearch?placename=#{Geokit::Inflector.url_escape(address_str)}&maxRows=10"

        if premium
          "http://ws.geonames.net#{params}&username=#{key}"
        else
          "http://api.geonames.org#{params}&username=#{key}"
        end
      end

      XML_MAPPINGS = {
          city:         'name',
          state_name:   'adminName1',
          state_code:   'adminCode1',
          zip:          'postalcode',
          country_code: 'countryCode',
          lat:          'lat',
          lng:          'lng',
      }

      def self.parse_xml(xml)
        count = xml.elements['geonames/totalResultsCount']
        return GeoLoc.new unless !count.nil? && count.text.to_i > 0
        loc = nil
        xml.elements.each('geonames/code') do |element|
          extracted_loc = new_loc
          # take all
          set_mappings(extracted_loc, element, XML_MAPPINGS)
          extracted_loc.success = true
          if loc.nil?
            loc = extracted_loc
          else
            loc.all.push(extracted_loc)
          end
        end
        loc.success = true
        loc
      end
    end
  end
end
