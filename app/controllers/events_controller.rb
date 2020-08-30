class EventsController < ApplicationController
  before_action :require_user, only: [:new, :create]
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
      flash[:notice] = 'Event successfully created'
      redirect_to @event
    else
      flash[:alert] = 'Something went wrong. Check and try again'
      render :new
    end
  end

  def attend_event
    redirect_to login_path if session[:user_id].nil?
    @event = Event.find(params[:id])
    registration = @event.attendances.build
    registration.attendee_id = current_user.id
    if registration.save
      flash[:notice] = 'Thanks you for registering to attend this event'
      redirect_to event_path(@event)
    else
      flash.now[:alert] = 'Your registration for the event was unsuccessful. Plese try again'
      redirect_to root_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
