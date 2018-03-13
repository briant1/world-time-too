class FavoritesController < ApplicationController
  def cities
    cities = City.where("favorites.user_id = ?", current_user.id).joins(:favorites).includes(:country)
    cities.each do |city|
      timezone = Timezone.fetch(city.timezone)
      city.current_time = timezone.local_to_utc(Time.now)
    end
    #TODO: json_builder
    render :json => { success: true, data: cities.as_json(methods: [:name, :current_time], include: :country), :status => 200 }
  end
  def create
    favorite_service = FavoriteService.new
    if favorite_service.assign_favorite(params[:favorite], current_user)
      render :json => { success: true, :status => 200 }
    end
  end
end
