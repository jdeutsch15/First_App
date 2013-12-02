module EventsHelper
def rating_ballot
	if @rating = current_student.ratings.find_by_event_id(params[:id])
		@rating
	else
		current_student.ratings.new
	end
end
def current_student_rating
	if @rating=current_student.ratings.find_by_event_id(params[:id])
		@rating.value
	else
		"N/A"
	end
end
end
