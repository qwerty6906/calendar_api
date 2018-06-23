class EventsController < ApplicationController
  def index
    @events = current_user.events.all

    render json: @events
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      render json: @event, status: :created
    else 
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :begin, :end)
  end
end
