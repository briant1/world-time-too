require 'wikipedia'
class CountryService
  def initialize
  end
  def get_or_create_country(data)
    country = Country.find_by_name(data[:country_code])
    if !country
      wikipedia_url = Wikipedia.find(data[:country_code]).fullurl
      country = Country.create(name: data[:country_code], wikipedia_url: wikipedia_url)
    end
    country
  end
  def get_or_create_city(country, data)
    city = City.where(city: data[:city], state: data[:state]).first
    if !city
      timezone = Timezone.lookup(data[:lat], data[:lng])
      wikipedia_page = Wikipedia.find("#{data[:city]} #{data[:state]}")
      city = City.create(city: data[:city],
                         state: data[:state],
                         wikipedia_url: wikipedia_page.fullurl,
                         timezone: timezone,
                         has_dst: timezone.dst?(Time.now),
                         country_id: country.id,
                         lng: data[:lng],
                         lat: data[:lat])
    end
    city
  end
end

