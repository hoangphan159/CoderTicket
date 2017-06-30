class VenuesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)

    if @venue.save
      flash[:success] = "Venue created successfull!"
      redirect_to events_path
    else
      render 'new'
    end
  end

  private
  def venue_params
    params.require(:venue).permit([:name, :full_address, :region_id])
  end
end
