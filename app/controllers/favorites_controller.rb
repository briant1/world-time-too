class FavoritesController < ApplicationController
  def cities
    cities = City.where("favorites.user_id = ?", current_user.id).joins(:favorites).includes(:country)
    cities.each do |city|
      timezone = Timezone.fetch(city.timezone)
      #render on server since we know the timezone/time and don't want the browser to alter it
      city.current_time = timezone.time(Time.now).strftime("%A, %B %d %Y, %H:%M%p")
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
