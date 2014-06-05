class NotepagesController < ApplicationController
	def index
    @notepages = Notepage.where(notesection_id: @notesection.id)
  end
  
  def new
    @notesection = Notesection.find(params[:notesection_id])
    @notepage = Notepage.new(notepage_params)
    @notepage.notesection_id = @notesection.id
    render 'new'
  end
  def show
    @notesection = Notesection.find(params[:notesection_id])
    @notepages = Notepage.where(notesection_id: @notesection.id)
    @notepage = Notepage.find(params[:id])
  end


  def create
    @notesection = Notesection.find(params[:notesection_id])
    @notepage = Notepage.new(notepage_params)
    @notepage.notesection_id = @notesection.id
    if @notepage.save
      redirect_to @notesection
    else
      @error=t("Title can't be blank")
      render 'new'
    end
  end

  def edit
    @notesection = Notesection.find(params[:notesection_id])
    @notepage = Notepage.find(params[:id])
  end

  def update
    @notesection = Notesection.find(params[:notesection_id])
    @notepage = Notepage.find(params[:id])
    @notepage.update_attributes(notepage_params)
    if @notepage.update(notepage_params)
      redirect_to  @notesection
    else
      @error=t("Title can't be blank")
      render 'edit'
    end
  end
  
  def destroy
    @notesection = Notesection.find(params[:notesection_id])
    @notepage = @notesection.notepages.find(params[:id])
    @notepage.destroy
    redirect_to notesection_path(@notesection)
  end

  private
    def notepage_params
      params.require(:notepage).permit(:title, :description)
    end
end
