class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def upcoming
    @events = Event.where('starts_on > ?', time.now)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.create
  end

  def create

  end
end
