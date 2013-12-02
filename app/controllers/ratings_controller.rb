class RatingsController < ApplicationController
	before_filter :authenticate_student!
def create
	@event=Event.find_by_id(params[:event_id])
	if current_student.id==@event.id
		redirect_to event_path(@event), :alert=>"You cannot rate for your own photo!"
	else
		@rating=Rating.new(params[:rating])
		@rating.event_id=@event.id
		@rating.student_id=current_student.id
		if @rating.save
			respond_to do |format|
				format.html {redirect_to event_path(@event), :notice => "Your rating has been saved!"}
				format.js
			end
		end
	end
end
def update 
	@event=Event.find_by_id(params[:event_id])
	if current_student.id==@event.id
		redirect_to event_path(@event), :alert=>"You cannot rate for your own photo!"
	else
		@rating=current_student.ratings.find_by_event_id(@event.id)
		if @rating.update_attributes(params[:rating])
			respond_to do |format|
				format.html {redirect_to event_path(@event), :notice => "Your rating has been updated!"}
				format.js
			end
		end
	end
end
end
