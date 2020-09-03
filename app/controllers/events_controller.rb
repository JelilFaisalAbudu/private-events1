class EventsController < ApplicationController
  before_action :require_user, only: %i[new create attended_event]

  def new
    @event = current_user.created_events.build
  end

  def index
    @events = Event.all
    @previous_events = @events.previous_events
    @upcoming_events = @events.upcoming_events
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:notice] = 'Event successfully created'
      redirect_to event_path(@event)

    else
      flash[:alert] = 'Something went wrong. Check and try again'
      render :new
    end
  end

  def attended_event
    event = Event.find(params[:idz])
    if event.date < Date.today
      flash[:alert] = 'This event has already ended. Please try next one.'
    else
      current_user.attended_events << event
      flash[:notice] = 'Event added successfully to your events list. Don\'t forget to attend.'
      redirect_to event_path(event)
    end
  end

  def unattend_event
    event = Event.find(params[:idz])
    current_user.attended_events.delete(event)
    flash[:info] = 'Event successfully removed from your events list.'
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
