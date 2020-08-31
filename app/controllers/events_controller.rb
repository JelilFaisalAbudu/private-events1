class EventsController < ApplicationController
  before_action :require_user, only: [:new, :create, :attend_event]
  before_action :set_event, only: [:attend_event, :show]
  def new
    @event = current_user.created_events.build
  end

  def index
    @events = Event.all
  end

  def show
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:notice] = 'Event successfully created'
      
    else
      flash[:alert] = 'Something went wrong. Check and try again'
      render :new
    end
  end

  def attended_event
    event = Event.find(params[:idz])
    # if @current_user.attended_events.include?(event)
    #   flash[:danger] = 'This event is already in your events list! Please try next one.'
    # else
    if event.date < Date.today
      flash[:alert] = 'This event has already ended. Please try next one.'
      redirect_to event_path(event)
    else
      current_user.attended_events << event
      flash[:notice] = 'Event added successfully to your events list. Don\'t forget to attend.'
      redirect_to root_path
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
