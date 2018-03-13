class MarketingController < ApplicationController
  def index
    @popular = City.popular
    @recent = City.order("created_at desc").limit(5)
    @countries = Country.all
  end
end
