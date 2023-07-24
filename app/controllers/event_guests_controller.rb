class EventGuestsController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def create 
        
        @event_guest = EventGuest.new 
        @event_guest.attendee = current_user
        @event_guest.attended_event = Event.find(params[:event_id])
        
        if @event_guest.save 
            redirect_to root_path 
        else 
            render "events/show", :unprocessable_entity
        end 
        
    end 

    def destroy 
        if EventGuest.exists?(params[:id])
            @event_guest = EventGuest.find(params[:id])
            @event_guest.destroy 
        end
        redirect_to root_path, status: :see_other
    end 

    
end
