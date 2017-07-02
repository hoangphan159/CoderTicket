class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :publish, :mine]

  def index
    @current_user = current_user
    if params[:search].present?
      @events = Event.search(params[:search])
    else
      @events = Event.upcoming
    end
  end

  def show
    @current_user = current_user
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def publish
    @event = Event.find(params[:id])

    if @event.tickets.any? && @event.published_at.nil?
      @event.published_at = Time.now()
      if @event.save
        flash[:success] = "Successfully published..."
        redirect_to mine_events_path
      else
        flash[:success] = @event.errors.full_messages
        redirect_to mine_events_path
      end
    else
      flash[:error] = "Please add ticket type before publish an event!"
      redirect_to mine_events_path
    end
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event created successfull!"
      redirect_to mine_events_path
    else
      flash[:error] = @event.errors.full_messages
      render 'new'
    end
  end

  def mine
    @current_user = current_user
    @events = current_user.events || []
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to events_path
    else
      render 'edit'
    end
  end

  private
  def event_params
    params.required(:event).permit(
      :name,
      :starts_at,
      :ends_at,
      :venue_id,
      :hero_image_url,
      :extended_html_description,
      :category_id)
  end
end
