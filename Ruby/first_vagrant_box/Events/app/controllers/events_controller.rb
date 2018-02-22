class EventsController < ApplicationController
	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to '/events'
		else
			flash[:error] = @event.errors.full_messages
			redirect_to :back
		end
	end

	private
	def event_params
		params.require(:event).permit(:name, :date, :location, :state, :users_id)
	end

end
