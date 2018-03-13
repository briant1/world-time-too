class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  def index

  end

  def perform_search
    address = params[:address]
    geo_search_service = GeoSearchService.new

    logger.debug "searching for #{address}"
    data = geo_search_service.search(address)
    render :json => { success: true, data: data.all.as_json, :status => 200 }
  end
end
