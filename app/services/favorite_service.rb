class FavoriteService
  def initialize
  end
  def assign_favorite(data, user)
    country_service = CountryService.new
    country = country_service.get_or_create_country(data)
    city = country_service.get_or_create_city(country, data)

    Favorite.create(city_id: city.id, user_id: user.id)
    true
  end
end