class NotesectionsController < ApplicationController
	def new
    @notesection = Notesection.new
  end

  def create
    @notesection = Notesection.new(notesection_params)
    @notesection.user_id = current_user.id
    if @notesection.save
      redirect_to notesections_path
    else
      @error=t("Title can't be blank")
      render 'new'
    end
  end
  
  def show
    @notesection = Notesection.find(params[:id])
    @notepage = Notepage.where(notesection_id: @notesection.id)
    @notepage.sort! { |a,b| a.title.downcase <=> b.title.downcase }
  end

  def index
    @notesection = Notesection.new
    @notesections = Notesection.where(user_id: current_user.id)
  end

  def edit
    @notesection = Notesection.find(params[:id])
  end

  def update
    @notesection = Notesection.find(params[:id])
    if @notesection.update(notesection_params)
      redirect_to notesections_path
    else
      @error=t("Title can't be blank")
      render 'edit'
    end
  end

  def destroy
    @notesection = Notesection.find(params[:id])
    @notesection.destroy
    redirect_to notesections_path
  end

  private
    def notesection_params
      params.require(:notesection).permit(:title)
    end
end
