class EventsController < ApplicationController
  def new
    @event = current_user.created_events.build
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:notice] = "Event successfully created"
      redirect_to @event
    else
      flash[:alert] = "Something went wrong. Check and try again"
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
  
end
