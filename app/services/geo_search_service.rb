class GeoSearchService
  def initialize

  end
  def search(address)
    Geokit::Geocoders::CustomGeonamesGeocoder.geocode(address)
  end
end