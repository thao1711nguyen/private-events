class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :update]

    def index 
        @past_events = Event.past 
        @future_events = Event.future
    end

    def new 
        @event = Event.new 
    end 
    
    def create 
        @event = current_user.creating_events.build(event_hash)
        if @event.save 
            redirect_to user_path 
        else 
            flash.now[:alert] = "Event can not be created!"
            render :new, status: :unprocessable_entity 
        end 
    end 
    def show 
        @event = Event.find(params[:id])
        @event_guest = EventGuest.where("attended_event_id = ? AND attendee_id = ?", @event.id, current_user.id)
        if @event_guest.exists? 
            @event_guest = @event_guest.take 
        else 
            @event_guest = nil 
        end
    end 

    def destroy 
        @event = Event.find(params[:id])
        if current_user.creating_events.include?(@event)
            @event.destroy 
            redirect_to root_path
        else 
            redirect_to root_path, status: :unauthorized
        end
    end 
    def edit 
        @event = Event.find(params[:id])
    end
    def update 
        @event = Event.find(params[:id])
        if @event.update(event_hash) 
            redirect_to @event
        else 
            render :edit, status: :unprocessable_entity
        end 
    end 

    private 
    def event_hash 
        params.require(:event).permit(:title, :date, :location,)
    end
end
