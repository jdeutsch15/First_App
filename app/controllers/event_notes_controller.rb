class EventNotesController < ApplicationController
	
   before_filter :authenticate_student!
   def index
    
    @event_notes=EventNote.paginate(page: params[:page], per_page: 15) 
   
    respond_to do |format|
      format.html
      format.json{ render json: @event_notes}
  end

end
 def show

    @event_note=EventNote.find(params[:id])
    
    
    respond_to do |format|
      format.html
      format.json {render json: @event_note}
  end
end
  def create
    puts "in create"
    @event_note = EventNote.new(params[:event_note])
    @event_note.student_id=current_student.id 

   
    @event_note.save!
  	
    respond_to do |format|
      if @event_note.id.nil?
        format.html { render action: "new" }
        format.js
      else
        format.html { redirect_to @event_note , notice: 'event_note was successfully created.' }
        format.js
       end
      
    end
  end
  def edit
  @event_note = EventNote.find(params[:id])
  
  @event_note.save!
end
def new
  @event_note = EventNote.new
  respond_to |format|
  format.html
  format.json { render json: @event_note}

end
def destroy 
	@event_note=EventNote.find(params[:id])
	@event_note.destroy
	redirect_to event_notes_path
	end

end

