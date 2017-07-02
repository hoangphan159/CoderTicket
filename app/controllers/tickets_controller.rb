class TicketsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.build
  end

  def buy
    @event = Event.find(params[:event_id])
  end

  def purchase
    flash[:success] = "Your tickets has been purchased successfully! Thank you!"
    redirect_to upcoming_path
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.build(ticket_params)

    if @ticket.save
      flash[:success] = "Ticket type successfully created..."
      redirect_to event_path(@event)
    else
      flash[:error] = @ticket.errors.full_messages
      render 'new'
    end
  end

  private

  def ticket_params
    params.require(:ticket_type).permit(:name, :price, :max_quantity)
  end
end
