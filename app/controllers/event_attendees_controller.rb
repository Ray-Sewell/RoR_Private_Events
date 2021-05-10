class EventAttendeesController < ApplicationController

    def create
        @found_user = User.find_by(name: event_attendee_params[:attendee_id])
        if @found_user
            event_attendee_params[:attendee_id] = @found_user.id
            respond_to do |format|
                if @found_user.event_attendees.build(event_attendee_params).save
                    format.html { redirect_to event_path, notice: "User invited!" }
                    format.json { render :show, status: :created, location: @event }
                else
                    format.html { redirect_to event_path, alert: "User could not be invited" }
                    format.json { render json: @event_attendee.errors, status: :unprocessable_entity }
                end
            end
        else
            redirect_to event_path, alert: "Oops that user could not be found!"
        end
    end


    private
        # Only allow a list of trusted parameters through.
        def event_path
            Event.find(event_attendee_params[:event_id])
        end
        def event_attendee_params
            params.require(:event_attendee).permit(:attendee_id, :event_id)
        end
end
